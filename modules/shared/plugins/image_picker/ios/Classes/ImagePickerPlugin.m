// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import "ImagePickerPlugin.h"

#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <Photos/Photos.h>
#import <UIKit/UIKit.h>
#import <PhotosUI/PHPhotoLibrary+PhotosUISupport.h>
#import <PhotosUI/PHPicker.h>

static NSString * const kFLTImageSuffixOFGIF = @"gif";

@interface FLTImagePickerPlugin ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate,PHPickerViewControllerDelegate>
@end

static const int SOURCE_CAMERA = 0;
static const int SOURCE_GALLERY = 1;
typedef void (^PhotosAuthorizedBlock)(void);


@implementation FLTImagePickerPlugin {
  FlutterResult _result;
  NSDictionary *_arguments;
  UIImagePickerController *_imagePickerController;
  UIViewController *_viewController;
  BOOL _needGif;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
  FlutterMethodChannel *channel =
      [FlutterMethodChannel methodChannelWithName:@"plugins.flutter.io/image_picker"
                                  binaryMessenger:[registrar messenger]];
  UIViewController *viewController =
      [UIApplication sharedApplication].delegate.window.rootViewController;
  FLTImagePickerPlugin *instance =
      [[FLTImagePickerPlugin alloc] initWithViewController:viewController];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (instancetype)initWithViewController:(UIViewController *)viewController {
  self = [super init];
  if (self) {
    _viewController = viewController;
    _imagePickerController = [[UIImagePickerController alloc] init];
    _needGif = NO;
  }
  return self;
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    if(_viewController.presentedViewController != nil) {
        if(result) {
            result([FlutterError errorWithCode:@"multiple_request"
                                        message:@"Cancelled request"
                                        details:nil]);
        }
        return;
    }
    
  if (_result) {
    _result([FlutterError errorWithCode:@"multiple_request"
                                message:@"Cancelled by a second request"
                                details:nil]);
    _result = nil;
  }

  if ([@"pickImage" isEqualToString:call.method]) {
      
    _imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    _imagePickerController.delegate = self;
    _imagePickerController.mediaTypes = @[ (NSString *)kUTTypeImage ];

    _result = result;
    _arguments = call.arguments;
      

    int imageSource = [[_arguments objectForKey:@"source"] intValue];
    _needGif = [[_arguments objectForKey:@"onlyGif"] boolValue];
    switch (imageSource) {
      case SOURCE_CAMERA:
        [self showCamera];
        break;
      case SOURCE_GALLERY:
        [self showPhotoLibrary];
        break;
      default:
        result([FlutterError errorWithCode:@"invalid_source"
                                   message:@"Invalid image source."
                                   details:nil]);
        break;
    }
  } else if ([@"pickImages" isEqualToString:call.method]) {
      if (@available(iOS 14, *)) {
          _result = result;
          _arguments = call.arguments;
          PHPickerConfiguration *configuration = [[PHPickerConfiguration alloc] init];
          //只获取image类型资源
          configuration.filter = [PHPickerFilter imagesFilter];
          //可以多选
          configuration.selectionLimit = [_arguments[@"count"] intValue];
          if([configuration respondsToSelector:@selector(setPreferredAssetRepresentationMode:)]){
              //fix 14.0的内测版本没有这个方法会crash
              configuration.preferredAssetRepresentationMode = PHPickerConfigurationAssetRepresentationModeCurrent;
          }
          PHPickerViewController *pickerVC = [[PHPickerViewController alloc] initWithConfiguration:configuration];
          pickerVC.delegate = self;
          [_viewController presentViewController:pickerVC animated:YES completion:^{
              
          }];
      } else {
          _result(nil);
      }

  } else if ([@"pickVideo" isEqualToString:call.method]) {

    _imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    _imagePickerController.delegate = self;
    _imagePickerController.mediaTypes = @[
      (NSString *)kUTTypeMovie, (NSString *)kUTTypeAVIMovie, (NSString *)kUTTypeVideo,
      (NSString *)kUTTypeMPEG4
    ];
    _imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;

    _result = result;
    _arguments = call.arguments;

    int imageSource = [[_arguments objectForKey:@"source"] intValue];

    switch (imageSource) {
      case SOURCE_CAMERA:
        [self showCamera];
        break;
      case SOURCE_GALLERY:
        [self showPhotoLibrary];
        break;
      default:
        result([FlutterError errorWithCode:@"invalid_source"
                                   message:@"Invalid video source."
                                   details:nil]);
        break;
    }
  }else if ([@"saveToCameraRoll" isEqualToString:call.method]){
      
      [self saveToCameraRoll:[call.arguments objectForKey:@"source"]  resolve:result];
  }else if ([@"saveByteDataImageToGallery" isEqualToString:call.method]){
      NSDictionary *dic = call.arguments;
      FlutterStandardTypedData *data =[dic objectForKey:@"uint8List"];
      UIImage *image=[UIImage imageWithData:data.data];
      __block ALAssetsLibrary *lib = [[ALAssetsLibrary alloc] init];
      [lib writeImageToSavedPhotosAlbum:image.CGImage metadata:nil completionBlock:^(NSURL *assetURL, NSError *error)
       {
          NSString *str =assetURL.absoluteString;
          NSString *string =@"://";
          NSRange range = [str rangeOfString:string];//匹配得到的下标
          if(range.location+range.length<str.length){
              str = [str substringFromIndex:range.location+range.length];
              //NSLog(@"%@",str);
              if (error) {
                  
              }else{
                  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                  formatter.dateFormat = @"yyyyMMddHHmmss";
                  
                  NSString *string;
                  NSString *subStr = @"&ext=";//指定字符串
                  if ([str containsString:subStr])
                  {//先做安全判断
                      NSRange subStrRange = [str rangeOfString:subStr];//找出指定字符串的range
                      NSInteger index = subStrRange.location + subStrRange.length;//获得“指定的字符以后的所有字符”的起始点
                      NSString *restStr = [str substringFromIndex:index];
                      string =restStr;
                  }else{
                      string =@"png";
                  }
                  NSString *name = [NSString stringWithFormat:@"%@01.%@",[formatter stringFromDate:[NSDate date]],string];
                  
                  NSString  *jpgPath = [NSHomeDirectory()     stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@",name]];
                  //保存到沙盒
   
                  [UIImageJPEGRepresentation(image,1.0) writeToFile:jpgPath atomically:YES];
                  NSString *aPath3=[NSString stringWithFormat:@"%@/Documents/%@",NSHomeDirectory(),name];
                  
                  result(aPath3);
              }
          }
          
      }];
      
  }
  else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)showCamera {
  // Camera is not available on simulators
  if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {

    _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    [_viewController presentViewController:_imagePickerController animated:YES completion:nil];
  } else {
    [[[UIAlertView alloc] initWithTitle:@"Error"
                                message:@"Camera not available."
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
  }
}

- (void)showPhotoLibrary {
    
  // No need to check if SourceType is available. It always is.
  _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
  [_viewController presentViewController:_imagePickerController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker
    didFinishPickingMediaWithInfo:(NSDictionary<NSString *, id> *)info {
  NSURL *videoURL = [info objectForKey:UIImagePickerControllerMediaURL];
  UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
  [_imagePickerController dismissViewControllerAnimated:YES completion:nil];

  if (videoURL != nil) {
    NSData *data = [NSData dataWithContentsOfURL:videoURL];
    NSString *guid = [[NSProcessInfo processInfo] globallyUniqueString];
    NSString *tmpFile = [NSString stringWithFormat:@"image_picker_%@.MOV", guid];
    NSString *tmpDirectory = NSTemporaryDirectory();
    NSString *tmpPath = [tmpDirectory stringByAppendingPathComponent:tmpFile];

    if ([[NSFileManager defaultManager] createFileAtPath:tmpPath contents:data attributes:nil]) {
      if(_result) _result(tmpPath);
    } else {
      if(_result) _result([FlutterError errorWithCode:@"create_error"
                                  message:@"Temporary file could not be created"
                                  details:nil]);
    }
  } else {
      NSURL *gifURL = [self acquireGIFURLForMediaInfo:info];
      if (_needGif && gifURL) {
          /// 处理Gif
          __weak typeof(self) weakSelf = self;
          [self storeImageWithMediaInfo:info suffix:kFLTImageSuffixOFGIF storeCompletion:^(NSString *filePath) {
              __strong typeof(self) strongSelf = weakSelf;
              [strongSelf feedBack:filePath];
              //置空
              strongSelf->_result = nil;
              strongSelf->_arguments = nil;
              strongSelf->_needGif = NO;
          }];
          
      } else {
          /// 按照静态图片处理
          if (image == nil) {
              image = [info objectForKey:UIImagePickerControllerOriginalImage];
          }
          [self storeImage:image];
          _result = nil;
          _arguments = nil;
      }
  }
}

- (void)picker:(PHPickerViewController *)picker didFinishPicking:(NSArray<PHPickerResult *> *)results
API_AVAILABLE(ios(14)){
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSMutableArray<NSString *> *arr = [NSMutableArray new];
    NSNumber *maxWidth = [_arguments objectForKey:@"maxWidth"];
    NSNumber *maxHeight = [_arguments objectForKey:@"maxHeight"];
    __weak typeof(self) weakSelf = self;
    if (results != nil && results.count > 0) {
        NSInteger selectCount = results.count;
        __block NSInteger handCount = 0;
        for (int i = 0; i < selectCount;i++) {
            PHPickerResult *result = results[i];
            [result.itemProvider loadObjectOfClass:[UIImage class] completionHandler:^(__kindof id<NSItemProviderReading>  _Nullable object, NSError * _Nullable error) {
                if (object) {
                    UIImage *image = [weakSelf normalizedImage:object];
                    if (maxWidth != (id)[NSNull null] || maxHeight != (id)[NSNull null]) {
                      image = [weakSelf scaledImage:image maxWidth:maxWidth maxHeight:maxHeight];
                    }

                    NSData *data = UIImageJPEGRepresentation(image, 1.0);
                    NSString *guid = [[NSProcessInfo processInfo] globallyUniqueString];
                    NSString *tmpFile = [NSString stringWithFormat:@"image_picker_%@.jpg", guid];
                    NSString *tmpDirectory = NSTemporaryDirectory();
                    NSString *tmpPath = [tmpDirectory stringByAppendingPathComponent:tmpFile];
                    if ([[NSFileManager defaultManager] createFileAtPath:tmpPath contents:data attributes:nil]) {
                        @synchronized (arr){
                            [arr addObject:tmpPath];
                        }
                    }
                }
                handCount++;
                if (handCount == selectCount) {
                    if (self->_result) {
                        if (selectCount == arr.count) {
                            self->_result(arr);
                        }else{
                            self->_result([FlutterError errorWithCode:@"create_error"
                                                        message:@"Temporary file could not be created"
                                                        details:nil]);
                        }
                        self->_result = nil;
                    }
                }
            }];
        }
    }else{
        _result = nil;
        _arguments = nil;
    }
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
  [_imagePickerController dismissViewControllerAnimated:YES completion:nil];
  if(_result) _result(nil);

  _result = nil;
  _arguments = nil;
}


static void requestPhotoLibraryAccess(FlutterResult reject, PhotosAuthorizedBlock authorizedBlock) {
    PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
    if (authStatus == PHAuthorizationStatusRestricted) {
        reject(@"Access to photo library is restricted");
    } else if (authStatus == PHAuthorizationStatusAuthorized) {
        authorizedBlock();
    } else if (authStatus == PHAuthorizationStatusNotDetermined) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            requestPhotoLibraryAccess(reject, authorizedBlock);
        }];
    } else {
        reject(@"Access to photo library was denied");
    }
}


- (void)saveToCameraRoll:(NSString *)uri
                 resolve:(FlutterResult)resolve
{
    if(![uri isKindOfClass:[NSString class]]){
        resolve(@"参数错误");
        return;
    }
    
    NSString* type;
    __block PHObjectPlaceholder *placeholder;
    
    // We load images and videos differently.
    // Images have many custom loaders which can load images from ALAssetsLibrary URLs, PHPhotoLibrary
    // URLs, `data:` URIs, etc. Video URLs are passed directly through for now; it may be nice to support
    // more ways of loading videos in the future.
    __block NSURL *inputURI = nil;
    __block UIImage *inputImage = nil;
    __block NSString* fileName;
     __block NSString* localId;
    void (^saveBlock)(void) = ^void() {
        // performChanges and the completionHandler are called on
        // arbitrary threads, not the main thread - this is safe
        // for now since all JS is queued and executed on a single thread.
        // We should reevaluate this if that assumption changes.
        [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
            PHAssetChangeRequest *changeRequest;
            
            // Defaults to "photo". `type` is an optional param.
            if ([type isEqualToString:@"video"]) {
                changeRequest = [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:inputURI];
            } else {
                changeRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:inputImage];
            }
            
            placeholder = [changeRequest placeholderForCreatedAsset];
            localId = [[changeRequest placeholderForCreatedAsset] localIdentifier];
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                NSLog(@"save image successful ");
                PHFetchResult* assetResult = [PHAsset fetchAssetsWithLocalIdentifiers:@[localId] options:nil];
                            PHAsset *asset = [assetResult firstObject];

                            if (@available(iOS 13.0, *)) {
                                [asset requestContentEditingInputWithOptions:nil completionHandler:^(PHContentEditingInput * _Nullable contentEditingInput, NSDictionary * _Nonnull info) {
                                    fileName= contentEditingInput.fullSizeImageURL.absoluteString;
                                    resolve(nil);
                                }];
                            } else {
                                [[PHImageManager defaultManager] requestImageDataForAsset:asset options:nil resultHandler:^(NSData *imageData, NSString *dataUTI, UIImageOrientation orientation, NSDictionary *info) {
                                    NSLog(@"Success %@ %@",dataUTI,info);

                                    NSLog(@"Success PHImageFileURLKey %@  ", (NSString *)[info objectForKey:@"PHImageFileURLKey"]);
                                    fileName=((NSURL *)[info objectForKey:@"PHImageFileURLKey"]).absoluteString;
                                    resolve(nil);
                                }];
                            }
                //NSString *uri = [NSString stringWithFormat:@"ph://%@", [placeholder localIdentifier]];
                //resolve(nil);
            } else {
                resolve(@"保存失败");
            }
        }];
    };
    
    void (^loadBlock)(void) = ^void() {
        if ([type isEqualToString:@"video"]) {
            inputURI = [NSURL fileURLWithPath:uri];
            saveBlock();
        } else {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                inputImage = [UIImage imageWithContentsOfFile:uri];
                if(inputImage){
                    saveBlock();
                }else{
                    resolve(@"保存失败");
                }
            });
        }
    };
    
    requestPhotoLibraryAccess(resolve, loadBlock);
}



// The way we save images to the tmp dir currently throws away all EXIF data
// (including the orientation of the image). That means, pics taken in portrait
// will not be orientated correctly as is. To avoid that, we rotate the actual
// image data.
// TODO(goderbauer): investigate how to preserve EXIF data.
- (UIImage *)normalizedImage:(UIImage *)image {
  if (image.imageOrientation == UIImageOrientationUp) return image;

  UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
  [image drawInRect:(CGRect){0, 0, image.size}];
  UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return normalizedImage;
}

- (UIImage *)scaledImage:(UIImage *)image
                maxWidth:(NSNumber *)maxWidth
               maxHeight:(NSNumber *)maxHeight {
  double originalWidth = image.size.width;
  double originalHeight = image.size.height;

  bool hasMaxWidth = maxWidth != (id)[NSNull null];
  bool hasMaxHeight = maxHeight != (id)[NSNull null];

  double width = hasMaxWidth ? MIN([maxWidth doubleValue], originalWidth) : originalWidth;
  double height = hasMaxHeight ? MIN([maxHeight doubleValue], originalHeight) : originalHeight;

  bool shouldDownscaleWidth = hasMaxWidth && [maxWidth doubleValue] < originalWidth;
  bool shouldDownscaleHeight = hasMaxHeight && [maxHeight doubleValue] < originalHeight;
  bool shouldDownscale = shouldDownscaleWidth || shouldDownscaleHeight;

  if (shouldDownscale) {
    double downscaledWidth = floor((height / originalHeight) * originalWidth);
    double downscaledHeight = floor((width / originalWidth) * originalHeight);

    if (width < height) {
      if (!hasMaxWidth) {
        width = downscaledWidth;
      } else {
        height = downscaledHeight;
      }
    } else if (height < width) {
      if (!hasMaxHeight) {
        height = downscaledHeight;
      } else {
        width = downscaledWidth;
      }
    } else {
      if (originalWidth < originalHeight) {
        width = downscaledWidth;
      } else if (originalHeight < originalWidth) {
        height = downscaledHeight;
      }
    }
  }

  UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), NO, 1.0);
  [image drawInRect:CGRectMake(0, 0, width, height)];

  UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return scaledImage;
}

#pragma mark -- Private
- (void)feedBack:(NSString *)filePath {
    if (!_result) {
        return;
    }
    if (filePath) {
        _result(filePath);
    } else {
        _result([FlutterError errorWithCode:@"create_error"
                                                message:@"Temporary file could not be created"
                                                details:nil]);
    }
}

- (void)storeImage:(UIImage *)image {
    image = [self normalizedImage:image];
    
    NSNumber *maxWidth = [_arguments objectForKey:@"maxWidth"];
    NSNumber *maxHeight = [_arguments objectForKey:@"maxHeight"];
    
    if (maxWidth != (id)[NSNull null] || maxHeight != (id)[NSNull null]) {
        image = [self scaledImage:image maxWidth:maxWidth maxHeight:maxHeight];
    }
    
    NSData *data = UIImageJPEGRepresentation(image, 1.0);
    NSString *guid = [[NSProcessInfo processInfo] globallyUniqueString];
    NSString *tmpFile = [NSString stringWithFormat:@"image_picker_%@.jpg", guid];
    NSString *tmpDirectory = NSTemporaryDirectory();
    NSString *tmpPath = [tmpDirectory stringByAppendingPathComponent:tmpFile];
    
    if ([[NSFileManager defaultManager] createFileAtPath:tmpPath contents:data attributes:nil]) {
        if(_result) _result(tmpPath);
    } else {
        if(_result) _result([FlutterError errorWithCode:@"create_error"
                                                message:@"Temporary file could not be created"
                                                details:nil]);
    }
}

#pragma mark -- GIF
- (NSURL * __nullable)acquireGIFURLForMediaInfo:(NSDictionary *)mediaInfo {
    NSURL *gifURL = nil;
    if (@available(iOS 11.0, *)) {
#if TARGET_IPHONE_SIMULATOR  //模拟器
        gifURL = [self acquireURLBefore11OrSimulatorForMediaInfo:mediaInfo];
#elif TARGET_OS_IPHONE      //真机
        gifURL = [self acquireURLAfter11ForMediaInfo:mediaInfo];
#endif
    } else {
        gifURL = [self acquireURLBefore11OrSimulatorForMediaInfo:mediaInfo];
    }
    return gifURL;
}

// iOS 11版本之前 or 模拟器 获取图片URL
- (NSURL *__nullable)acquireURLBefore11OrSimulatorForMediaInfo:(NSDictionary *)mediaInfo {
    NSURL * imageURL = [mediaInfo valueForKey:[self acquireImageKey]];
    NSAssert(imageURL != nil, @"iOS ImagePicker URL not found");
    if (!imageURL) {
        return nil;
    }
    
    NSArray<NSString *> *imageSepStrs = [imageURL.absoluteString componentsSeparatedByString:@"ext"];
    if (imageSepStrs.count < 2) {
        BOOL isContainGifSuffix = [imageSepStrs.lastObject containsString:kFLTImageSuffixOFGIF.uppercaseString];
        if (!isContainGifSuffix) {
            return nil;
        }
    }
    
    return imageURL;
}

// iOS 11及其之后的版本获取图片URL
- (NSURL *__nullable)acquireURLAfter11ForMediaInfo:(NSDictionary *)mediaInfo {
    NSURL * imageURL = [mediaInfo valueForKey:[self acquireImageKey]];
    NSAssert(imageURL != nil, @"iOS ImagePicker URL not found");
    if (!imageURL) {
        return nil;
    }
    BOOL isGIF = [imageURL.absoluteString hasSuffix:[@"." stringByAppendingString:kFLTImageSuffixOFGIF]];
    return isGIF ? imageURL : nil;
}

- (NSString *)acquireImageKey {
    NSString *imageKey = @"";
    if (@available(iOS 11.0, *)) {
#if TARGET_IPHONE_SIMULATOR  //模拟器
        imageKey = UIImagePickerControllerReferenceURL;
#elif TARGET_OS_IPHONE      //真机
        imageKey = UIImagePickerControllerImageURL;
#endif
    } else {
        imageKey = UIImagePickerControllerReferenceURL;
    }
    return imageKey;
}

// 存储data
// @return ：存储成功则返回路径path；失败则返回nil
- (NSString *)storeImageWithData:(NSData *)data suffix:(NSString *)suffix {
    NSString *guid = [[NSProcessInfo processInfo] globallyUniqueString];
    NSString *tmpFile = [NSString stringWithFormat:@"image_picker_%@.%@", guid, suffix];
    NSString *tmpDirectory = NSTemporaryDirectory();
    NSString *tmpPath = [tmpDirectory stringByAppendingPathComponent:tmpFile];
    
    BOOL storeSuccess = [[NSFileManager defaultManager] createFileAtPath:tmpPath contents:data attributes:nil];
    return storeSuccess ? tmpPath : nil;
}

- (void)storeImageWithMediaInfo:(NSDictionary *)mediaInfo suffix:(NSString *)suffix storeCompletion:(void(^)(NSString *filePath))storeCompletion {
    NSURL *imageURL = [mediaInfo valueForKey:[self acquireImageKey]];
    [self requestImageDataWithImageURL:imageURL completion:^(NSData *data) {
        NSString *filePath = [self storeImageWithData:data suffix:suffix];
        if (storeCompletion) {
            storeCompletion(filePath);
        }
    }];
}

- (void)requestImageDataWithImageURL:(NSURL *)imageURL completion:(void(^)(NSData *data))completion {
    if (!completion) {
        return;
    }
    
    if (@available(iOS 11, *)) {
#if TARGET_IPHONE_SIMULATOR  //模拟器
        [self requestImageBefore11ORSimulatorWithImageURL:imageURL completion:completion];
#elif TARGET_OS_IPHONE      //真机
        completion([NSData dataWithContentsOfURL:imageURL]);
#endif
    } else {
        [self requestImageBefore11ORSimulatorWithImageURL:imageURL completion:completion];
    }
}

- (void)requestImageBefore11ORSimulatorWithImageURL:(NSURL *)imageURL completion:(void(^)(NSData *data))completion {
    PHFetchResult*result = [PHAsset fetchAssetsWithALAssetURLs:@[imageURL] options:nil];
    PHAsset *asset = [result firstObject];
    PHImageRequestOptions *phImageRequestOptions = [[PHImageRequestOptions alloc] init];
    [[PHImageManager defaultManager] requestImageDataForAsset:asset options:phImageRequestOptions resultHandler:^(NSData * imageData, NSString * dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
        if (completion) {
            completion(imageData);
        }
    }];
}

@end
