// QGMP4Box.m
// Tencent is pleased to support the open source community by making vap available.
//
// Copyright (C) 2020 THL A29 Limited, a Tencent company.  All rights reserved.
//
// Licensed under the MIT License (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
//
// http://opensource.org/licenses/MIT
//
// Unless required by applicable law or agreed to in writing, software distributed under the License is
// distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either express or implied. See the License for the specific language governing permissions and
// limitations under the License.

#import "CommonQGMP4Box.h"
#import "CommonQGMP4Parser.h"

NSInteger const kCQGBoxSizeLengthInBytes = 4;
NSInteger const kCQGBoxTypeLengthInBytes = 4;
NSInteger const kCQGBoxLargeSizeLengthInBytes = 8;
NSInteger const kCQGBoxLargeSizeFlagLengthInBytes = 1;

#pragma mark - boxes
#pragma mark -- base box
@implementation CommonQGMP4Box

- (instancetype)initWithType:(CommonQGMP4BoxType)type startIndex:(unsigned long long)startIndexInBytes length:(unsigned long long)length {
    
    if (self = [super init]) {
        _type = type;
        _startIndexInBytes = startIndexInBytes;
        _length = length;
    }
    return self;
}

/**
 前序遍历递归查找指定类型的子box，不包含自身。

 @param type box类型
 @return 符合条件的第一个子box
 */
- (id)subBoxOfType:(CommonQGMP4BoxType)type {
    
    if (self.subBoxes) {
        for (CommonQGMP4Box *subBox in self.subBoxes) {
            if (subBox.type == type) {
                return subBox;
            }
            CommonQGMP4Box *box = [subBox subBoxOfType:type];
            if (box) {
                return box;
            }
        }
    }
    return nil;
}

/**
 向上查找指定类型的box，不包含自身

 @param type box类型
 @return h符合条件的第一个box
 */
- (id)superBoxOfType:(CommonQGMP4BoxType)type {
    
    if (self.superBox) {
        if (self.superBox.type == type) {
            return self.superBox;
        }
        CommonQGMP4Box *box = [self.superBox superBoxOfType:type];
        if (box) {
            return box;
        }
    }
    return nil;
}

- (NSString *)description {
    
    return [self descriptionForRecursionLevel:0];
}

- (NSString *)descriptionForRecursionLevel:(NSInteger)level {
    
    __block NSString *des = [NSString stringWithFormat:@"Box:%@ offset:%@ size:%@ ",self.typeString,@(self.startIndexInBytes),@(self.length)];
    for (int i = 0; i < level; i++) {
        des = [NSString stringWithFormat:@"|--%@",des];
    }
    des = [NSString stringWithFormat:@"\n%@",des];
    [self.subBoxes enumerateObjectsUsingBlock:^(CommonQGMP4Box *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        des = [des stringByAppendingString:[obj descriptionForRecursionLevel:(level+1)]];
    }];
    return des;
}

- (NSString *)typeString {
    
    NSUInteger value = self.type;
    NSString *des = @"";
    while (value > 0) {
        NSUInteger hexValue = value&0xff;
        value = value>>8;
        des = [NSString stringWithFormat:@"%c%@",(int)hexValue,des];
    }
    return des;
}

@end

#pragma mark -- hvcc box
/**
 * QGMP4HvccBox
 */
@implementation CommonQGMP4HvccBox
@end

/**
 * QGCttsEntry 通过dts计算pts
 */
@implementation CommonQGCttsEntry

@end

/**
 * QGMP4CttsBox 通过dts计算pts
 */
@implementation CommonQGMP4CttsBox
- (void)boxDidParsed:(CommonQGMp4BoxDataFetcher)datablock {
    if (!_compositionOffsets) {
        _compositionOffsets = [NSMutableArray new];
    }

    NSData *cttsData = datablock(self);
    const char *bytes = cttsData.bytes;
    uint32_t entryCount = READ32BIT(&bytes[12]);

    for (int i = 0; i < entryCount; ++i) {
        uint32_t sampleCount = READ32BIT(&bytes[16+i*8]);
        uint32_t compositionOffset = READ32BIT(&bytes[16+i*8+4]);
        for (int j = 0; j < sampleCount; j++) {
            [_compositionOffsets addObject:@(compositionOffset)];
        }
    }
}

@end

#pragma mark -- mdat box
@implementation CommonQGMP4MdatBox

@end

#pragma mark -- avcc box
@implementation CommonQGMP4AvccBox

@end

@implementation CommonQGMP4MvhdBox

@end

/**
 在video track中，stsd包含了sps&pps等编解码数据
 
 stsd是⼀个必不可少的atom，在它的 header和version字段后会有⼀个entry count字段，
 根据entry的个数，每个entry会有type信息，根据type不同sample description会提供不
 同的信息，例如对于video track，会有“VisualSampleEntry”类型信息，对于audio track
 会有“AudioSampleEntry”类型信息。视频的关键信息如SPS和PPS，编码类型、宽⾼、
 ⻓度，⾳频的声道、采样等信息都会出现在这个box中。
 */
@implementation CommonQGMP4StsdBox

@end

/**
 There are two variants of the sample size box. The first variant has a fixed size 32-bit field for representing the sample sizes; it permits defining a constant size for all samples in a track. The second variant permits smaller size fields, to save space when the sizes are varying but small. One of these boxes must be present; the first version is preferred for maximum compatibility.
 记录了每个sample的大小
 */
@implementation CommonQGMP4StszBox

- (void)boxDidParsed:(CommonQGMp4BoxDataFetcher)datablock {
    
    if (!_sampleSizes) {
        _sampleSizes = [NSMutableArray new];
    }
    NSData *stszData = datablock(self);
    const char *bytes = stszData.bytes;
    uint32_t sampleSize = READ32BIT(&bytes[12]);
    uint32_t sampleCount = READ32BIT(&bytes[16]);
    self.sampleCount = sampleCount;
    for (int i = 0; i < sampleCount; i ++) {
        if (sampleSize > 0) {
            [self.sampleSizes addObject:@(sampleSize)];
        } else {
            uint32_t entryValue =  READ32BIT(&bytes[20+i*4]);
            [self.sampleSizes addObject:@(entryValue)];
        }
    }
}

@end

/**
 Samples within the media data are grouped into chunks. Chunks can be of different sizes, and the samples within a chunk can have different sizes. This table can be used to find the chunk that contains a sample, its position, and the associated sample description.
 stsc记录了每个chunk有多少个Sample https://img-blog.csdn.net/20140613154636296
 */
@implementation CommonQGStscEntry

@end

/*
 stsc，记录了每个chunk有多少个sample，通过这个表可以找到指定的sample
 */
@implementation CommonQGMP4StscBox

- (void)boxDidParsed:(CommonQGMp4BoxDataFetcher)datablock {
    
    if (!_entries) {
        _entries = [NSMutableArray new];
    }
    NSData *stscData = datablock(self);
    const char *bytes = stscData.bytes;
    uint32_t entry_count = READ32BIT(&bytes[12]);
    for (int i = 0; i < entry_count; ++i) {
        CommonQGStscEntry *entry = [CommonQGStscEntry new];
        entry.firstChunk = READ32BIT(&bytes[16+i*12]);
        entry.samplesPerChunk = READ32BIT(&bytes[16+i*12+4]);
        entry.sampleDescriptionIndex = READ32BIT(&bytes[16+i*12+8]);
        [_entries addObject:entry];
    }
}

@end

/**
 stco 记录每个chunk位置信息，与stsc结合可以算出每个sample的位置和大小
 
 entry_count is an integer that gives the number of entries in the following table
 chunk_offset is a 32 or 64 bit integer that gives the offset of the start of a chunk into its containing
 media file.
 */
@implementation CommonQGMP4StcoBox

- (void)boxDidParsed:(CommonQGMp4BoxDataFetcher)datablock {
    
    if (!_chunkOffsets) {
        _chunkOffsets = [NSMutableArray new];
    }
    NSData *stcoData = datablock(self);
    const char *bytes = stcoData.bytes;
    uint32_t entry_count = READ32BIT(&bytes[12]);
    self.chunkCount = entry_count;
    for (int i = 0; i < entry_count; ++i) {
        [self.chunkOffsets addObject:@(READ32BIT(&bytes[16+i*4]))];
    }
}

@end

@implementation CommonQGMP4StssBox

- (void)boxDidParsed:(CommonQGMp4BoxDataFetcher)datablock {
    if (!_syncSamples) {
        _syncSamples = [NSMutableArray new];
    }
    NSData *stssData = datablock(self);
    const char *bytes = stssData.bytes;
    uint32_t sample_count = READ32BIT(&bytes[12]);
    for (int i = 0; i < sample_count; i++) {
        NSInteger index = READ32BIT(&bytes[16 + 4 * i]) - 1;
        [_syncSamples addObject:[NSNumber numberWithInteger:index]];
    }
}

@end

/**
 Decoding Time to Sample Box
 用来计算dts
 */
@implementation CommonQGSttsEntry

@end

/*
stts记录了sample的时间信息，⾥⾯有多个entry，每个entry⾥⾯的的sample的时⻓都是
对应这个entry的delta值，通过这个atom可以得到⼀个时间和sample的映射表。
*/
@implementation CommonQGMP4SttsBox

- (void)boxDidParsed:(CommonQGMp4BoxDataFetcher)datablock {
    
    if (!_entries) {
        _entries = [NSMutableArray new];
    }
    NSData *sttsData = datablock(self);
    const char *bytes = sttsData.bytes;
    uint32_t entry_count = READ32BIT(&bytes[12]);
    for (int i = 0; i < entry_count; ++i) {
        CommonQGSttsEntry *entry = [CommonQGSttsEntry new];
        entry.sampleCount = READ32BIT(&bytes[16+i*8]);;
        entry.sampleDelta = READ32BIT(&bytes[16+i*8+4]);
        [_entries addObject:entry];
    }
}

@end

@implementation CommonQGMP4TrackBox

@end

@implementation CommonQGMP4HdlrBox

- (void)boxDidParsed:(CommonQGMp4BoxDataFetcher)datablock {
    
    NSData *hdlrData = datablock(self);
    const char *bytes = hdlrData.bytes;
    uint32_t trackType = READ32BIT(&bytes[16]);
    self.trackType = trackType;
}

@end

@implementation CommonQGMP4Sample

@end

@implementation CommonQGChunkOffsetEntry

@end

@implementation CommonQGMP4BoxFactory

+ (CommonQGMP4Box *)createBoxForType:(CommonQGMP4BoxType)type startIndex:(unsigned long long)startIndexInBytes length:(unsigned long long)length {
    
    Class boxClass = [self boxClassForType:type] ?: [CommonQGMP4Box class];
    CommonQGMP4Box *box = [[boxClass alloc] initWithType:type startIndex:startIndexInBytes length:length];
    return box;
}

+ (Class)boxClassForType:(CommonQGMP4BoxType)type {
    
    switch (type) {
        case CommonQGMP4BoxType_ftyp:
        case CommonQGMP4BoxType_free:
        case CommonQGMP4BoxType_moov:
        case CommonQGMP4BoxType_mvhd:
        case CommonQGMP4BoxType_trak:
        case CommonQGMP4BoxType_tkhd:
        case CommonQGMP4BoxType_edts:
        case CommonQGMP4BoxType_elst:
        case CommonQGMP4BoxType_mdia:
        case CommonQGMP4BoxType_minf:
        case CommonQGMP4BoxType_vmhd:
        case CommonQGMP4BoxType_dinf:
        case CommonQGMP4BoxType_dref:
        case CommonQGMP4BoxType_url:
        case CommonQGMP4BoxType_stbl:
        case CommonQGMP4BoxType_avc1:
        case CommonQGMP4BoxType_udta:
        case CommonQGMP4BoxType_meta:
        case CommonQGMP4BoxType_ilst:
        case CommonQGMP4BoxType_data:
        case CommonQGMP4BoxType_iods:
        case CommonQGMP4BoxType_wide:
        case CommonQGMP4BoxType_loci:
        case CommonQGMP4BoxType_smhd:
            return [CommonQGMP4Box class];
        case CommonQGMP4BoxType_stss:
            return [CommonQGMP4StssBox class];
        case CommonQGMP4BoxType_mdat:
            return [CommonQGMP4MdatBox class];
        case CommonQGMP4BoxType_avcC:
            return [CommonQGMP4AvccBox class];
        case CommonQGMP4BoxType_mdhd:
            return [CommonQGMP4MvhdBox class];
        case CommonQGMP4BoxType_stsd:
            return [CommonQGMP4StsdBox class];
        case CommonQGMP4BoxType_stsz:
            return [CommonQGMP4StszBox class];
        case CommonQGMP4BoxType_hdlr:
            return [CommonQGMP4HdlrBox class];
        case CommonQGMP4BoxType_stsc:
            return [CommonQGMP4StscBox class];
        case CommonQGMP4BoxType_stts:
            return [CommonQGMP4SttsBox class];
        case CommonQGMP4BoxType_stco:
            return [CommonQGMP4StcoBox class];
        case CommonQGMP4BoxType_hvcC:
            return [CommonQGMP4HvccBox class];
        case CommonQGMP4BoxType_ctts:
            return [CommonQGMP4CttsBox class];
        default:
            return nil;
    }
}

/**
 根据boxClassForType:方法的返回判断是否为一个合法的box类型

 @param type box类型
 @return 除QGMP4BoxType定义的类型（不包含QGMP4BoxType_unknown）外全部为不合法类型
 */
+ (BOOL)isTypeValueValid:(CommonQGMP4BoxType)type {
    
    Class class = [self boxClassForType:type];
    if (class) {
        return YES;
    }
    return NO;
}

@end
