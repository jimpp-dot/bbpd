#import "FlutterInappPurchasePlugin.h"

// iOS内购错误码参考：SKErrorCode枚举 - https://qonversion.io/blog/handling-storekit-errors/
@interface PaymentInfo : NSObject
@property (nonatomic, assign) BOOL autoFinish;
@property (nonatomic, copy) FlutterResult result;
@end
@implementation PaymentInfo
+ (PaymentInfo *)infoWith:(FlutterResult)result autoFinish:(BOOL)autoFinish
{
    PaymentInfo *info = [PaymentInfo new];
    info.result = result;
    info.autoFinish = autoFinish;
    return info;
}
@end







@interface FlutterInappPurchasePlugin()<FlutterStreamHandler> {
    FlutterResult restoreResult;
}

///// Apple后台的商品
@property (atomic, retain) NSMutableArray<SKProduct*>* appleProducts;
/// 直接通过Apple商店的促销页面购买的商品
@property (atomic, retain) NSMutableArray<SKProduct*>* appStoreInitiatedProducts;
///// Apple后台的商品的在途请求
@property (atomic, retain) NSMutableDictionary<NSValue*, NSObject*>* fetchProductRequest;
/// 购买商品的在途请求，组合Apple的支付对象和关联的业务参数
@property (nonatomic, strong) NSMutableDictionary<SKPayment*, PaymentInfo*>* paymentRequests;
/// 未完成的交易
@property (nonatomic, strong) NSMutableDictionary<NSString *, SKPaymentTransaction *> *unfinishedTransactions;
@property (nonatomic, retain) FlutterMethodChannel* channel;
@property(nonatomic, strong) FlutterEventSink eventSink;

@end

@implementation FlutterInappPurchasePlugin

@synthesize appleProducts;
@synthesize appStoreInitiatedProducts;
@synthesize fetchProductRequest;
@synthesize paymentRequests;
@synthesize unfinishedTransactions;
@synthesize channel;
@synthesize eventSink;

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterInappPurchasePlugin* instance = [[FlutterInappPurchasePlugin alloc] init];
    instance.channel = [FlutterMethodChannel
                        methodChannelWithName:@"flutter_inapp"
                        binaryMessenger:[registrar messenger]];
    [[SKPaymentQueue defaultQueue] addTransactionObserver:instance];
    [registrar addMethodCallDelegate:instance channel:instance.channel];
    
    
    FlutterEventChannel *stream = [FlutterEventChannel eventChannelWithName:@"inapp.message" binaryMessenger:registrar.messenger];
    [stream setStreamHandler:instance];
}

- (instancetype)init {
    self = [super init];
    self.appleProducts = [NSMutableArray new];
    self.appStoreInitiatedProducts = [NSMutableArray new];
    self.fetchProductRequest = [NSMutableDictionary new];
    self.paymentRequests = [NSMutableDictionary new];
    self.unfinishedTransactions = [NSMutableDictionary new];
    
    return self;
}

- (void)dealloc {
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
    [self.channel setMethodCallHandler:nil];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else if ([@"canMakePayments" isEqualToString:call.method]) {
        [self canMakePayments:result];
    } else if ([@"getItems" isEqualToString:call.method]) {
        NSArray<NSString*>* identifiers = (NSArray<NSString*>*)call.arguments[@"skus"];
        if (identifiers != nil && identifiers.count > 0) {
            [self fetchBusinessProducts:identifiers result:result];
        } else {
            result([FlutterError errorWithCode:@"0" message:NSLocalizedString(@"iap_error_Invalid_args", nil) details:nil]);
        }
    } else if ([@"buyProductWithFinishTransaction" isEqualToString:call.method]) {
        NSString* identifier = (NSString*)call.arguments[@"sku"];
        if (identifier != nil) {
            [self purchase:identifier result:result autoFinish:YES];
        } else {
            result([FlutterError errorWithCode:@"0" message:NSLocalizedString(@"iap_error_Invalid_args", nil) details:nil]);
        }
    } else if ([@"buyProductWithoutFinishTransaction" isEqualToString:call.method]) {
        NSString* identifier = (NSString*)call.arguments[@"sku"];
        if (identifier != nil) {
            [self purchase:identifier result:result autoFinish:NO];
        } else {
            result([FlutterError errorWithCode:@"0" message:NSLocalizedString(@"iap_error_Invalid_args", nil) details:nil]);
        }
    } else if([@"getReceiptData" isEqualToString:call.method]){
        NSData* data = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] appStoreReceiptURL]];
        if (data == nil) {
            result(nil);
            return;
        }
        
        NSString* receiptStr = [data base64EncodedStringWithOptions:0];
        result(receiptStr);
    } else if ([@"shouldRestore" isEqualToString:call.method]){
        NSArray* list = [SKPaymentQueue defaultQueue].transactions;
        __block BOOL shouldRestore = NO;
        [list enumerateObjectsUsingBlock:^(SKPaymentTransaction*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if(obj.transactionState == SKPaymentTransactionStatePurchased){
                shouldRestore = YES;
                *stop = YES;
            }
        }];
        
        result(@(shouldRestore));
    }
    else if ([@"finishTransaction" isEqualToString:call.method]) {
        NSString *transactionId = call.arguments[@"transactionId"];
        if ([transactionId isKindOfClass:[NSString class]]) {
            SKPaymentTransaction *currentTransaction = self.unfinishedTransactions[transactionId];
            [self finishTransaction:currentTransaction];
        }
        result(@"Finished current transaction");
    }
    else if ([@"finishAllTransaction" isEqualToString:call.method]){
        __weak typeof(self) weakSelf = self;
        [[[SKPaymentQueue defaultQueue] transactions] enumerateObjectsUsingBlock:^(SKPaymentTransaction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if(obj.transactionState != SKPaymentTransactionStatePurchasing) {
                [weakSelf finishTransaction:obj];
            }
        }];
        
        result(@"Finished all transaction");
    }
    
    else if ([@"restoreCompletedTransactions" isEqualToString:call.method]) {
        [self restoreCompletedTransactions:result];
    } else if ([@"getAppStoreInitiatedProducts" isEqualToString:call.method]) {
        [self getAppStoreInitiatedProducts:result];
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)canMakePayments:(FlutterResult)result {
    BOOL canMakePayments = [SKPaymentQueue canMakePayments];
    NSString* str = canMakePayments ? @"true" : @"false";
    result(str);
}

- (void)fetchBusinessProducts:(NSArray<NSString*>*)identifiers result:(FlutterResult)result {
    if (result == nil) {
        return;
    }
    
    if (identifiers != nil && identifiers.count > 0) {
        @try {
            NSMutableArray<SKProduct*>* neededProducts = [NSMutableArray new];
            BOOL allHas = YES;
            for (NSString *pidNeeded in identifiers) {
                BOOL has = NO;
                for (SKProduct* p in appleProducts) {
                    if ([p.productIdentifier isEqualToString:pidNeeded]) {
                        [neededProducts addObject:p];
                        has = YES;
                        break;
                    }
                }
                if (!has) {
                    allHas = NO;
                    break;
                }
            }
            
            if (allHas) {
                result([self getProductListAsDictionary:neededProducts]);
            } else {
                SKProductsRequest* request = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithArray:identifiers]];
                [request setDelegate:self];
                [fetchProductRequest setObject:@{@"result": result, @"ids": identifiers} forKey:[NSValue valueWithNonretainedObject:request]];
                [request start];
            }
        } @catch (NSException *exception) {
            result([FlutterError
                    errorWithCode:@"0"
                    message:NSLocalizedString(@"iap_error_SKErrorUnknown", nil)
                    details:nil]);
        }
    } else {
        result([FlutterError
                errorWithCode:@"0"
                message:NSLocalizedString(@"iap_error_SKErrorStoreProductNotAvailable", nil)
                details:nil]);
    }
}

- (void)request:(SKRequest *)request didFailWithError:(NSError *)error {
    FlutterResult result = nil;
    @try {
        NSValue* key = [NSValue valueWithNonretainedObject:request];
        result = ((NSDictionary *)[fetchProductRequest objectForKey:key])[@"result"];
        if (result != nil) {
            result([FlutterError
                    errorWithCode:[NSString stringWithFormat:@"%zd", error.code]
                    message:[self getErrorUserMessageFrom:error.code]
                    details:nil]);
        }
        [fetchProductRequest removeObjectForKey:key];
    } @catch (NSException *exception) {
        if (result) {
            result([FlutterError
                    errorWithCode:@"0"
                    message:NSLocalizedString(@"iap_error_SKErrorUnknown", nil)
                    details:nil]);
        }
    }
}

- (void)productsRequest:(nonnull SKProductsRequest *)request didReceiveResponse:(nonnull SKProductsResponse *)response {
    FlutterResult result = nil;
    @try {
        NSValue* key = [NSValue valueWithNonretainedObject:request];
        result = ((NSDictionary *)[fetchProductRequest objectForKey:key])[@"result"];
        NSArray<NSString*>* identifiers = ((NSDictionary *)[fetchProductRequest objectForKey:key])[@"ids"];
        [fetchProductRequest removeObjectForKey:key];
        if (result == nil) return;
        
        NSArray<SKProduct *> *responsePds = [response products];
        NSMutableArray *neededProducts = [NSMutableArray new];
        for (SKProduct *newP in responsePds) {
            if ([identifiers containsObject:newP.productIdentifier]) {
                [neededProducts addObject:newP];
            }
            
            BOOL has = NO;
            for (SKProduct *oldP in appleProducts) {
                NSInteger index = [appleProducts indexOfObject:oldP];
                if (newP.productIdentifier == oldP.productIdentifier) {
                    has = YES;
                    [appleProducts replaceObjectAtIndex:index withObject:newP];
                }
            }
            if (!has) {
                [appleProducts addObject:newP];
            }
        }

        result([self getProductListAsDictionary:neededProducts]);
    } @catch (NSException *exception) {
        if (result) {
            result([FlutterError
                    errorWithCode:@"0"
                    message:NSLocalizedString(@"iap_error_SKErrorUnknown", nil)
                    details:nil]);
        }
    }
}

-(NSMutableArray<NSDictionary*>*)getProductListAsDictionary:(NSArray<SKProduct *> *)products
{
    NSMutableArray<NSDictionary*>* allValues = [[NSMutableArray alloc] init];
    [products enumerateObjectsUsingBlock:^(SKProduct* product, NSUInteger idx, BOOL* stop) {
        [allValues addObject:[self getProductAsDictionary:product]];
    }];
    return allValues;
}

-(NSDictionary *)getProductAsDictionary:(SKProduct*)product{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    formatter.locale = product.priceLocale;
    NSString* localizedPrice = [formatter stringFromNumber:product.price];
    NSString* introductoryPrice;
    NSString* introductoryPricePaymentMode = @"";
    NSString* introductoryPriceNumberOfPeriods = @"";
    NSString* introductoryPriceSubscriptionPeriod = @"";

    // NSString* itemType = @"Do not use this. It returned sub only before";

    NSString* currencyCode = @"";
    NSString* periodNumberIOS = @"0";
    NSString* periodUnitIOS = @"";


    if (@available(iOS 11.2, *)) {
        formatter.locale = product.introductoryPrice.priceLocale;
        introductoryPrice = [formatter stringFromNumber:product.introductoryPrice.price];

        // itemType = product.subscriptionPeriod ? @"sub" : @"iap";
        unsigned long numOfUnits = (unsigned long) product.subscriptionPeriod.numberOfUnits;
        SKProductPeriodUnit unit = product.subscriptionPeriod.unit;

        if (unit == SKProductPeriodUnitYear) {
            periodUnitIOS = @"YEAR";
        } else if (unit == SKProductPeriodUnitMonth) {
            periodUnitIOS = @"MONTH";
        } else if (unit == SKProductPeriodUnitWeek) {
            periodUnitIOS = @"WEEK";
        } else if (unit == SKProductPeriodUnitDay) {
            periodUnitIOS = @"DAY";
        }

        periodNumberIOS = [NSString stringWithFormat:@"%lu", numOfUnits];

        // subscriptionPeriod = product.subscriptionPeriod ? [product.subscriptionPeriod stringValue] : @"";
        // introductoryPrice = product.introductoryPrice != nil ? [NSString stringWithFormat:@"%@", product.introductoryPrice] : @"";
        if (product.introductoryPrice != nil) {
          //SKProductDiscount introductoryPriceObj = product.introductoryPrice;
          formatter.locale = product.introductoryPrice.priceLocale;
          introductoryPrice = [formatter stringFromNumber:product.introductoryPrice.price];

          switch (product.introductoryPrice.paymentMode) {
              case SKProductDiscountPaymentModeFreeTrial:
                  introductoryPricePaymentMode = @"FREETRIAL";
                  break;
              case SKProductDiscountPaymentModePayAsYouGo:
                  introductoryPricePaymentMode = @"PAYASYOUGO";
                  break;
              case SKProductDiscountPaymentModePayUpFront:
                  introductoryPricePaymentMode = @"PAYUPFRONT";
                  break;
              default:
                  introductoryPricePaymentMode = @"";
                  break;
          }

          introductoryPriceNumberOfPeriods = [@(product.introductoryPrice.numberOfPeriods) stringValue];

          if (product.introductoryPrice.subscriptionPeriod.unit == SKProductPeriodUnitDay) {
              introductoryPriceSubscriptionPeriod = @"DAY";
          }	else if (product.introductoryPrice.subscriptionPeriod.unit == SKProductPeriodUnitWeek) {
              introductoryPriceSubscriptionPeriod = @"WEEK";
          }	else if (product.introductoryPrice.subscriptionPeriod.unit == SKProductPeriodUnitMonth) {
              introductoryPriceSubscriptionPeriod = @"MONTH";
          } else if (product.introductoryPrice.subscriptionPeriod.unit == SKProductPeriodUnitYear) {
              introductoryPriceSubscriptionPeriod = @"YEAR";
          } else {
              introductoryPriceSubscriptionPeriod = @"";
          }

        } else {
          introductoryPrice = @"";
          introductoryPricePaymentMode = @"";
          introductoryPriceNumberOfPeriods = @"";
          introductoryPriceSubscriptionPeriod = @"";
        }
    }

    if (@available(iOS 10.0, *)) {
      currencyCode = product.priceLocale.currencyCode;
    }

    NSDictionary *obj = [NSDictionary dictionaryWithObjectsAndKeys:
        product.productIdentifier, @"productId",
        [product.price stringValue], @"price",
        currencyCode, @"currency",
        product.localizedTitle ? product.localizedTitle : @"", @"title",
        product.localizedDescription ? product.localizedDescription : @"", @"description",
        localizedPrice, @"localizedPrice",
        periodNumberIOS, @"subscriptionPeriodNumberIOS",
        periodUnitIOS, @"subscriptionPeriodUnitIOS",
        introductoryPrice, @"introductoryPrice",
        introductoryPricePaymentMode, @"introductoryPricePaymentModeIOS",
        introductoryPriceNumberOfPeriods, @"introductoryPriceNumberOfPeriodsIOS",
        introductoryPriceSubscriptionPeriod, @"introductoryPriceSubscriptionPeriodIOS",
        nil
    ];
    
    return obj;
}

- (void)purchase:(NSString*)identifier result:(FlutterResult)result autoFinish:(BOOL)autoFinish
{
    SKPayment* payment = [self paymentWithProductId:identifier];
    if (payment) {
        [self.paymentRequests addEntriesFromDictionary:@{payment:[PaymentInfo infoWith:result autoFinish:autoFinish]}];
        [[SKPaymentQueue defaultQueue] addPayment:payment];
    } else {
        result([FlutterError errorWithCode:@"0"
                                   message:NSLocalizedString(@"iap_error_SKErrorStoreProductNotAvailable", nil)
                                   details:nil]);
    }
}

-(void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
    for (SKPaymentTransaction *transaction in transactions) {
        PaymentInfo *paymentInfo = [self.paymentRequests objectForKey:transaction.payment];
        FlutterResult result = paymentInfo.result;
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchasing:
                NSLog(@"IAP: 内购API-Purchase Started");
                break;
            case SKPaymentTransactionStatePurchased:
                NSLog(@"IAP: 内购API-Purchase Successful");
                [self purchaseProcess:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                NSLog(@"IAP: 内购API-Restored");
                break;
            case SKPaymentTransactionStateDeferred:
                NSLog(@"IAP: 内购API-Deferred (等待家长控制等类似情况)");
                break;
            case SKPaymentTransactionStateFailed:
                NSLog(@"IAP: 内购API-Failed");
                if (result == nil) return;
                [self.paymentRequests removeObjectForKey:transaction.payment];
                [self finishTransaction:transaction];

                result([FlutterError
                        errorWithCode:[NSString stringWithFormat:@"%zd", transaction.error.code]
                        message:[self getErrorUserMessageFrom:transaction.error.code]
                        details:nil
                ]);
                
                if(self.eventSink){
                    self.eventSink(@{
                        @"type": @"TransactionFailed",
                        @"data": @{@"code": [NSString stringWithFormat:@"%zd", transaction.error.code],
                                   @"message": [self getErrorUserMessageFrom:transaction.error.code]
                        }
                    });
                }
                break;
        }
    }
}

-(void)purchaseProcess:(SKPaymentTransaction *)transaction {
    NSString *transactionId = transaction.transactionIdentifier;
    SKPayment *payment = transaction.payment;
    if (!transactionId || !transaction || !payment) {
        return;
    }
    
    PaymentInfo *paymentInfo = [self.paymentRequests objectForKey:payment];
    if (paymentInfo.autoFinish) {
        [self finishTransaction:transaction];
    } else {
        [self.unfinishedTransactions addEntriesFromDictionary:@{transactionId:transaction}];
    }

    NSString* purchaseStr = [self getPurchaseDataString];
    if (paymentInfo.result != nil) {
        paymentInfo.result(purchaseStr);
    }else{
        //still submit to server for verification
        if (!paymentInfo.autoFinish) {
            if(self.eventSink){
                self.eventSink(@{@"type": @"verifyReceiptData",
                                 @"data": purchaseStr,});
            }
        }
    }
    [self.paymentRequests removeObjectForKey:payment];
}

- (NSString *)getPurchaseDataString {
    NSData *receiptData = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] appStoreReceiptURL]];
    if (receiptData == nil) return nil;
    
    return [receiptData base64EncodedStringWithOptions:0];
}

- (void)restoreCompletedTransactions:(FlutterResult)result {
    if (restoreResult) {
        //正在恢复，不要重复恢复
        result([FlutterError errorWithCode:@"0" message:NSLocalizedString(@"iap_error_restore_busy", nil) details:nil]);
        return;
    }
    
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
    restoreResult = result;
}

-(void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue {
    if (restoreResult != nil) {
        NSString *str = [self getPurchaseDataString];
        restoreResult(str);
    }
    restoreResult = nil;
}

- (void)getAppStoreInitiatedProducts:(FlutterResult)result {
    NSMutableArray<NSDictionary*>* initiatedProducts = [[NSMutableArray alloc] init];
    for (SKProduct* p in appStoreInitiatedProducts) {
        [initiatedProducts addObject:[self getProductAsDictionary:p]];
    }
    result(initiatedProducts);
}

#if defined(__IPHONE_11_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_11_0)
- (BOOL)paymentQueue:(SKPaymentQueue *)queue shouldAddStorePayment:(SKPayment *)payment forProduct:(SKProduct *)product {
    // Save any purchases initiated through the App Store
    // Get the products by calling getAppStoreInitiatedProducts and handle the purchase in dart
    [appStoreInitiatedProducts addObject:product];
    return NO;
}
#endif

- (void)finishTransaction:(SKPaymentTransaction *)transaction
{
    if (!transaction) {
        return;
    }
    
    NSString *transactionId = transaction.transactionIdentifier;
    if (transactionId) {
        [self.unfinishedTransactions removeObjectForKey:transactionId];
    }
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
}

- (SKPayment *)paymentWithProductId:(NSString *)identifier
{
    if (!identifier) {
        return nil;
    }
    
    SKPayment* payment = nil;
    for (SKProduct* p in appleProducts) {
        if ([p.productIdentifier isEqualToString:identifier]) {
            payment = [SKPayment paymentWithProduct:p];
            break;
        }
    }
    return payment;
}

#pragma mark - FlutterStreamHandler

- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                       eventSink:(FlutterEventSink)events{
    self.eventSink = events;
    
    return nil;
}


- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments{
    self.eventSink = nil;
    
    return nil;
}

#pragma mark - Property

- (NSString *)getErrorUserMessageFrom:(NSInteger)errorCode
{
    switch (errorCode) {
        case SKErrorUnknown:
            return NSLocalizedString(@"iap_error_SKErrorUnknown", nil);
        case SKErrorClientInvalid:
            return NSLocalizedString(@"iap_error_SKErrorClientInvalid", nil);
        case SKErrorPaymentCancelled:
            return NSLocalizedString(@"iap_error_SKErrorPaymentCancelled", nil);
        case SKErrorPaymentInvalid:
            return NSLocalizedString(@"iap_error_SKErrorPaymentInvalid", nil);
        case SKErrorPaymentNotAllowed:
            return NSLocalizedString(@"iap_error_SKErrorPaymentNotAllowed", nil);
        case SKErrorStoreProductNotAvailable:
            return NSLocalizedString(@"iap_error_SKErrorStoreProductNotAvailable", nil);
        case SKErrorCloudServicePermissionDenied:
            return NSLocalizedString(@"iap_error_SKErrorCloudServicePermissionDenied", nil);
        case SKErrorCloudServiceNetworkConnectionFailed:
            return NSLocalizedString(@"iap_error_SKErrorCloudServiceNetworkConnectionFailed", nil);
        case SKErrorCloudServiceRevoked:
            return NSLocalizedString(@"iap_error_SKErrorCloudServiceRevoked", nil);
        default:
            return NSLocalizedString(@"iap_error_SKErrorUnknown", nil);
    }
}

@end
