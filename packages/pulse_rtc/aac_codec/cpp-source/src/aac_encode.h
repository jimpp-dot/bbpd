//
// Created by Mac on 2022/3/24.
//

#ifndef COMMON_NEW_AAC_ENCODE_H
#define COMMON_NEW_AAC_ENCODE_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#if defined(_MSC_VER)
#include <getopt.h>
#else
#include <unistd.h>
#endif

// #include "fdk-aac/libAACenc/include/aacenc_lib.h"
#include "aacenc_lib.h"


#ifdef ANDROID
#include <android/log.h>
#endif

#define TAG_AAC_ENCODE "tag_aac_encode"
#ifdef ANDROID
#define INFO(...) __android_log_print(ANDROID_LOG_INFO, "tag_aac_encode", __VA_ARGS__)
#define ERROR(...) __android_log_print(ANDROID_LOG_ERROR, "tag_aac_encode", __VA_ARGS__)
// #define INFO(...) 
// #define ERROR(...) 
#else
#define INFO(...) fprintf(stdout, __VA_ARGS__)
#define ERROR(...) fprintf(stderr, __VA_ARGS__)
#endif

HANDLE_AACENCODER handle;
int handleInited = 0;
int initEncoder(int32_t channels)
{
    INFO("initEncoder start...\n");
    AACENC_ERROR result = aacEncOpen(&handle, 0, channels);
    if (result != AACENC_OK)
    {
        ERROR("Unable to open encoder. result = %d\n", result);
        return -1;
    }
    return 0;
}

void closeEncoder()
{
    if (handleInited)
    {
        aacEncClose(&handle);
        handleInited = false;
    }
}

int aac_encode_pcm_bytes(uint8_t *pcm_bytes, uint8_t *aac_bytes, int32_t pcm_byte_count, int32_t *p_aac_byte_count, int32_t channels)
{
    // INFO("liqf: aac_encode_pcm_bytes: pcm_byte_count = %d, aac_byte_count = %d, channels = %d\n", pcm_byte_count, *p_aac_byte_count, channels);

    int bitrate = 16000;
    int sample_rate;
    int input_size;
    uint8_t *input_buf;
    int16_t *convert_buf;
    // aot的取值：2 AAC-LC; 5 HE-AAC; 29 HE-AAC v2。29效率最高，但只能是双通道立体声，单通道只能选2或者5。一个AAC帧：HE-AAC v1/v2包含2048个sample，AAC-LC包含1024个sample。
    // int aot = 2;
    // int aot = 29;
    int aot = 5;
    int afterburner = 1;
    int eld_sbr = 0;
    int vbr = 0;
    // int vbr = 1;
    // HANDLE_AACENCODER handle;
    CHANNEL_MODE mode;
    AACENC_InfoStruct info = {0};

    sample_rate = 16000;

    switch (channels)
    {
    case 1:
        mode = MODE_1;
        break;
    case 2:
        mode = MODE_2;
        break;
    case 3:
        mode = MODE_1_2;
        break;
    case 4:
        mode = MODE_1_2_1;
        break;
    case 5:
        mode = MODE_1_2_2;
        break;
    case 6:
        mode = MODE_1_2_2_1;
        break;
    default:
        ERROR("Unsupported WAV channels %d\n", channels);
        return 1;
    }
    // if (aacEncOpen(&handle, 0, channels) != AACENC_OK)
    // {
    //     ERROR("Unable to open encoder\n");
    //     return 1;
    // }

    if (!handleInited)
    {
        int ret = initEncoder(channels);
        if (ret != AACENC_OK)
        {
            ERROR("Unable to initEncoder ret = 0x%x\n", ret);
            return -1;
        }
        handleInited = true;
    }
    // INFO("After initEncoder\n");

    // INFO("Before aacEncoder_SetParam\n");
    if (aacEncoder_SetParam(handle, AACENC_AOT, aot) != AACENC_OK)
    {
        ERROR("Unable to set the AOT\n");
        return -1;
    }
    if (aot == 39 && eld_sbr)
    {
        if (aacEncoder_SetParam(handle, AACENC_SBR_MODE, 1) != AACENC_OK)
        {
            ERROR("Unable to set SBR mode for ELD\n");
            return -1;
        }
    }
    if (aacEncoder_SetParam(handle, AACENC_SAMPLERATE, sample_rate) != AACENC_OK)
    {
        ERROR("Unable to set the sample rate\n");
        return -1;
    }
    if (aacEncoder_SetParam(handle, AACENC_CHANNELMODE, mode) != AACENC_OK)
    {
        ERROR("Unable to set the channel mode\n");
        return -1;
    }
    if (aacEncoder_SetParam(handle, AACENC_CHANNELORDER, 1) != AACENC_OK)
    {
        ERROR("Unable to set the wav channel order\n");
        return -1;
    }
    if (vbr)
    {
        if (aacEncoder_SetParam(handle, AACENC_BITRATEMODE, vbr) != AACENC_OK)
        {
            ERROR("Unable to set the VBR bitrate mode\n");
            return -1;
        }
    }
    else
    {
        if (aacEncoder_SetParam(handle, AACENC_BITRATE, bitrate) != AACENC_OK)
        {
            ERROR("Unable to set the bitrate\n");
            return -1;
        }
    }
    if (aacEncoder_SetParam(handle, AACENC_TRANSMUX, TT_MP4_ADTS) != AACENC_OK)
    {
        ERROR("Unable to set the ADTS transmux\n");
        return -1;
    }
    if (aacEncoder_SetParam(handle, AACENC_AFTERBURNER, afterburner) != AACENC_OK)
    {
        ERROR("Unable to set the afterburner mode\n");
        return -1;
    }
    // INFO("After aacEncoder_SetParam\n");

    if (aacEncEncode(handle, NULL, NULL, NULL, NULL) != AACENC_OK)
    {
        ERROR("Unable to initialize the encoder111\n");
        return -1;
    }

    AACENC_ERROR result = aacEncInfo(handle, &info);
    if (result != AACENC_OK)
    {
        ERROR("Unable to get the encoder info. result = 0x%x\n", result);
        return -1;
    }

    // INFO("!!! Begin encode ... info.frameLength = %d\n", info.frameLength);
    input_size = channels * 2 * info.frameLength;
    // input_buf = (uint8_t *)malloc(input_size);
    int seq = 0;
    input_buf = pcm_bytes;
    convert_buf = (int16_t *)malloc(input_size);

    while (seq * input_size < pcm_byte_count)
    {
        AACENC_BufDesc in_buf = {0}, out_buf = {0};
        AACENC_InArgs in_args = {0};
        AACENC_OutArgs out_args = {0};
        int in_identifier = IN_AUDIO_DATA;
        int in_size, in_elem_size;
        int out_identifier = OUT_BITSTREAM_DATA;
        int out_size, out_elem_size;
        int read, i;
        void *in_ptr, *out_ptr;
        uint8_t outbuf[20480];
        AACENC_ERROR err;

        // INFO("Before read...\n");
        // read = wav_read_data(wav, input_buf, input_size);
        int remain_byte_count = pcm_byte_count - seq * input_size;
        read = remain_byte_count > input_size ? input_size : remain_byte_count;
        for (i = 0; i < read / 2; i++)
        {
            const uint8_t *in = &input_buf[2 * i];
            convert_buf[i] = in[0] | (in[1] << 8);
        }
        in_ptr = convert_buf;
        in_size = read;
        in_elem_size = 2;

        in_args.numInSamples = read <= 0 ? -1 : read / 2; // 只支持16bit音频，每个采样点2个字节
        in_buf.numBufs = 1;
        in_buf.bufs = &in_ptr;
        in_buf.bufferIdentifiers = &in_identifier;
        in_buf.bufSizes = &in_size;
        in_buf.bufElSizes = &in_elem_size;

        out_ptr = outbuf;
        out_size = sizeof(outbuf);
        out_elem_size = 1;
        out_buf.numBufs = 1;
        out_buf.bufs = &out_ptr;
        out_buf.bufferIdentifiers = &out_identifier;
        out_buf.bufSizes = &out_size;
        out_buf.bufElSizes = &out_elem_size;

        // INFO("Before aacEncEncode...\n");
        err = aacEncEncode(handle, &in_buf, &out_buf, &in_args, &out_args);
        // INFO("aacEncEncode result = %d, seq = %d\n", err, seq);
        if (err != AACENC_OK)
        {
            if (err == AACENC_ENCODE_EOF) {
                // INFO("aacEncEncode.AACENC_ENCODE_EOF\n");
                break;
            }
            ERROR("Encoding failed\n");
            free(convert_buf);
            return -1;
        }
        // INFO("out_args.numOutBytes = %d\n", out_args.numOutBytes);
        if (out_args.numOutBytes != 0)
        {
            *p_aac_byte_count = out_args.numOutBytes;
            // fwrite(outbuf, 1, out_args.numOutBytes, out);
            memcpy(aac_bytes, outbuf, out_args.numOutBytes);
        }
        // break;
        ++seq;
        input_buf = pcm_bytes + seq * input_size;
    }

    free(convert_buf);

    return 0;
}

#endif // COMMON_NEW_AAC_ENCODE_H
