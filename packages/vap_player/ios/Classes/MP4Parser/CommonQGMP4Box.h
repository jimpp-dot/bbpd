// QGMP4Box.h
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

#import <Foundation/Foundation.h>

#define ATOM_TYPE(a, b, c, d) ((d) | ((c) << 8) | ((b) << 16) | ((unsigned)(a) << 24))
#define READ32BIT(bytes) ((((bytes)[0]&0xff)<<24)+(((bytes)[1]&0xff)<<16)+(((bytes)[2]&0xff)<<8)+((bytes)[3]&0xff))

extern NSInteger const kCQGBoxSizeLengthInBytes;
extern NSInteger const kCQGBoxTypeLengthInBytes;
extern NSInteger const kCQGBoxLargeSizeLengthInBytes;
extern NSInteger const kCQGBoxLargeSizeFlagLengthInBytes;

@class CommonQGMP4Box;
typedef NSData* (^CommonQGMp4BoxDataFetcher)(CommonQGMP4Box *box);

typedef NS_ENUM(NSUInteger, CommonQGMP4CodecType) {
    CommonQGMP4CodecTypeUnknown = 0,
    CommonQGMP4CodecTypeVideo,
    CommonQGMP4CodecTypeAudio
};

typedef NS_ENUM(uint32_t, CommonQGMP4TrackType) {
    
    CommonQGMP4TrackType_Video = ATOM_TYPE('v','i','d','e'),
    CommonQGMP4TrackType_Audio = ATOM_TYPE('s','o','u','n'),
    CommonQGMP4TrackType_Hint  = ATOM_TYPE('h','i','n','t')
};

typedef NS_ENUM(NSUInteger, CommonQGMP4BoxType) {
    
    CommonQGMP4BoxType_unknown        =   0x0,
    CommonQGMP4BoxType_ftyp           =   ATOM_TYPE('f','t','y','p'),//0x66747970,
    CommonQGMP4BoxType_free           =   ATOM_TYPE('f','r','e','e'),//0x66726565,
    CommonQGMP4BoxType_mdat           =   ATOM_TYPE('m','d','a','t'),//0x6d646174,
    CommonQGMP4BoxType_moov           =   ATOM_TYPE('m','o','o','v'),//0x6d6f6f76,
    CommonQGMP4BoxType_mvhd           =   ATOM_TYPE('m','v','h','d'),//0x6d766864,
    CommonQGMP4BoxType_iods           =   ATOM_TYPE('i','o','d','s'),//0x696f6473,
    CommonQGMP4BoxType_trak           =   ATOM_TYPE('t','r','a','k'),//0x7472616b,
    CommonQGMP4BoxType_tkhd           =   ATOM_TYPE('t','k','h','d'),//0x746b6864,
    CommonQGMP4BoxType_edts           =   ATOM_TYPE('e','d','t','s'),//0x65647473,
    CommonQGMP4BoxType_elst           =   ATOM_TYPE('e','l','s','t'),//0x656c7374,
    CommonQGMP4BoxType_mdia           =   ATOM_TYPE('m','d','i','a'),//0x6d646961,
    CommonQGMP4BoxType_mdhd           =   ATOM_TYPE('m','d','h','d'),//0x6d646864,
    CommonQGMP4BoxType_hdlr           =   ATOM_TYPE('h','d','l','r'),//0x68646c72,
    CommonQGMP4BoxType_minf           =   ATOM_TYPE('m','i','n','f'),//0x6d696e66,
    CommonQGMP4BoxType_vmhd           =   ATOM_TYPE('v','m','h','d'),//0x766d6864,
    CommonQGMP4BoxType_dinf           =   ATOM_TYPE('d','i','n','f'),//0x64696e66,
    CommonQGMP4BoxType_dref           =   ATOM_TYPE('d','r','e','f'),//0x64726566,
    CommonQGMP4BoxType_url            =   ATOM_TYPE( 0 ,'u','r','l'),//0x75726c,
    CommonQGMP4BoxType_stbl           =   ATOM_TYPE('s','t','b','l'),//0x7374626c,
    CommonQGMP4BoxType_stsd           =   ATOM_TYPE('s','t','s','d'),//0x73747364,
    CommonQGMP4BoxType_avc1           =   ATOM_TYPE('a','v','c','1'),//0x61766331,
    CommonQGMP4BoxType_avcC           =   ATOM_TYPE('a','v','c','C'),//0x61766343,
    CommonQGMP4BoxType_stts           =   ATOM_TYPE('s','t','t','s'),//0x73747473,
    CommonQGMP4BoxType_stss           =   ATOM_TYPE('s','t','s','s'),//0x73747373,
    CommonQGMP4BoxType_stsc           =   ATOM_TYPE('s','t','s','c'),//0x73747363,
    CommonQGMP4BoxType_stsz           =   ATOM_TYPE('s','t','s','z'),//0x7374737a,
    CommonQGMP4BoxType_stco           =   ATOM_TYPE('s','t','c','o'),//0x7374636f,
    CommonQGMP4BoxType_ctts           =   ATOM_TYPE('c', 't', 't', 's'),//只有视频有，主要⽤来记录pts和dts的差值，通过它可以计算出pts
    CommonQGMP4BoxType_udta           =   ATOM_TYPE('u','d','t','a'),//0x75647461,
    CommonQGMP4BoxType_meta           =   ATOM_TYPE('m','e','t','a'),//0x6d657461,
    CommonQGMP4BoxType_ilst           =   ATOM_TYPE('i','l','s','t'),//0x696c7374,
    CommonQGMP4BoxType_data           =   ATOM_TYPE('d','a','t','a'),//0x64617461,
    CommonQGMP4BoxType_wide           =   ATOM_TYPE('w','i','d','e'),//0x77696465,
    CommonQGMP4BoxType_loci           =   ATOM_TYPE('l','o','c','i'),//0x6c6f6369,
    CommonQGMP4BoxType_smhd           =   ATOM_TYPE('s','m','h','d'),//0x736d6864,
    CommonQGMP4BoxType_vapc           =   ATOM_TYPE('v','a','p','c'),//0x76617063,//vap专属，存储json配置信息
    CommonQGMP4BoxType_hvc1           =   ATOM_TYPE('h','v','c','1'),
    CommonQGMP4BoxType_hvcC           =   ATOM_TYPE('h','v','c','C')
};

typedef NS_ENUM(NSUInteger, CommonQGMP4VideoStreamCodecID) {
    CommonQGMP4VideoStreamCodecIDUnknown = 0,
    CommonQGMP4VideoStreamCodecIDH264,
    CommonQGMP4VideoStreamCodecIDH265
};
 
/**
 * QGCttsEntry
 */
@interface CommonQGCttsEntry : NSObject

/** sampleCount */
@property (nonatomic, assign) uint32_t sampleCount;
/** compositionOffset */
@property (nonatomic, assign) uint32_t compositionOffset;

@end

@interface CommonQGMP4BoxFactory : NSObject

+ (BOOL)isTypeValueValid:(CommonQGMP4BoxType)type;
+ (Class)boxClassForType:(CommonQGMP4BoxType)type;

+ (CommonQGMP4Box *)createBoxForType:(CommonQGMP4BoxType)type startIndex:(unsigned long long)startIndexInBytes length:(unsigned long long)length;

@end

@protocol CommonQGMP4BoxDelegate <NSObject>
@optional
- (void)boxDidParsed:(CommonQGMp4BoxDataFetcher)datablock;

@end

@interface CommonQGMP4Box : NSObject <CommonQGMP4BoxDelegate>

@property (nonatomic, assign) CommonQGMP4BoxType type;
@property (nonatomic, assign) unsigned long long length;
@property (nonatomic, assign) unsigned long long startIndexInBytes;
@property (nonatomic, weak) CommonQGMP4Box *superBox;
@property (nonatomic, strong) NSMutableArray *subBoxes;

- (instancetype)initWithType:(CommonQGMP4BoxType)type startIndex:(unsigned long long)startIndexInBytes length:(unsigned long long)length;

- (id)subBoxOfType:(CommonQGMP4BoxType)type;
- (id)superBoxOfType:(CommonQGMP4BoxType)type;

@end

//实际媒体数据，具体的划分等，都在moov⾥⾯。
@interface CommonQGMP4MdatBox : CommonQGMP4Box
@end

@interface CommonQGMP4AvccBox : CommonQGMP4Box
@end

@interface CommonQGMP4HvccBox : CommonQGMP4Box
@end

@interface CommonQGMP4MvhdBox : CommonQGMP4Box
@end

//sample description
@interface CommonQGMP4StsdBox : CommonQGMP4Box
@end

/**Samples within the media data are grouped into chunks. Chunks can be of different sizes, and the samples within a chunk can have different sizes. This table can be used to find the chunk that contains a sample, its position, and the associated sample description.
The table is compactly coded. Each entry gives the index of the first chunk of a run of chunks with the same characteristics. By subtracting one entry here from the previous one, you can compute how many chunks are in this run. You can convert this to a sample count by multiplying by the appropriate samples-per-chunk.*/
//https://blog.csdn.net/tung214/article/details/30492895
@interface CommonQGStscEntry : NSObject

@property (nonatomic, assign) uint32_t firstChunk;
@property (nonatomic, assign) uint32_t samplesPerChunk;
@property (nonatomic, assign) uint32_t sampleDescriptionIndex;

@end
@interface CommonQGMP4StscBox : CommonQGMP4Box

@property (nonatomic, strong) NSMutableArray<CommonQGStscEntry *> *entries;

@end

@interface CommonQGMP4StcoBox : CommonQGMP4Box

@property (nonatomic, assign) uint32_t chunkCount;
@property (nonatomic, strong) NSMutableArray<NSNumber *> *chunkOffsets;

@end

@interface CommonQGMP4StssBox : CommonQGMP4Box

@property(nonatomic, strong) NSMutableArray<NSNumber *> *syncSamples;

@end

/**
 * ctts
 */
@interface CommonQGMP4CttsBox : CommonQGMP4Box

/** compositionOffsets */
@property (nonatomic, strong) NSMutableArray<NSNumber *> *compositionOffsets;

@end

//This box contains a compact version of a table that allows indexing from decoding time to sample number. Other tables give sample sizes and pointers, from the sample number. Each entry in the table gives the number of consecutive samples with the same time delta, and the delta of those samples. By adding the deltas a complete time-to-sample map may be built.
@interface CommonQGSttsEntry : NSObject

@property (nonatomic, assign) uint32_t sampleCount;
@property (nonatomic, assign) uint32_t sampleDelta;

@end
@interface CommonQGMP4SttsBox : CommonQGMP4Box

@property (nonatomic, strong) NSMutableArray<CommonQGSttsEntry *> *entries;

@end

//sample size
@interface CommonQGMP4StszBox : CommonQGMP4Box

@property (nonatomic, assign) uint32_t sampleCount;
@property (nonatomic, strong) NSMutableArray<NSNumber *> *sampleSizes;

@end

@interface CommonQGMP4TrackBox : CommonQGMP4Box
@end

@interface CommonQGMP4HdlrBox : CommonQGMP4Box

@property (nonatomic, assign) CommonQGMP4TrackType trackType;

@end

@interface CommonQGMP4Sample : NSObject

@property (nonatomic, assign) CommonQGMP4CodecType codecType;
@property (nonatomic, assign) uint32_t sampleDelta;
@property (nonatomic, assign) uint32_t sampleSize;
@property (nonatomic, assign) uint32_t sampleIndex;
@property (nonatomic, assign) uint32_t chunkIndex;
@property (nonatomic, assign) uint32_t streamOffset;
@property (nonatomic, assign) uint64_t pts;
@property (nonatomic, assign) uint64_t dts;
@property (nonatomic, assign) BOOL isKeySample;

@end

@interface CommonQGChunkOffsetEntry : NSObject

@property (nonatomic, assign) uint32_t samplesPerChunk;
@property (nonatomic, assign) uint32_t offset;

@end
