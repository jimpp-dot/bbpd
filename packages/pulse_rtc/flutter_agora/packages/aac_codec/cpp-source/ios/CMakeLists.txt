cmake_minimum_required (VERSION 2.6)

project(fdk_aac)

set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/build/output/$ENV{ABI})
set(CMAKE_XCODE_ATTRIBUTE_DEVELOPMENT_TEAM "cjl_spy@163.com (A62988QAAA)" CACHE INTERNAL "")

aux_source_directory(${PROJECT_SOURCE_DIR}/../src SRC_FILES)

set(AACENC_SRC
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/aacEnc_ram.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/aacEnc_rom.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/aacenc.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/aacenc_lib.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/aacenc_pns.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/aacenc_tns.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/adj_thr.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/band_nrg.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/bandwidth.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/bit_cnt.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/bitenc.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/block_switch.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/channel_map.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/chaosmeasure.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/dyn_bits.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/grp_data.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/intensity.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/line_pe.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/metadata_compressor.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/metadata_main.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/mps_main.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/ms_stereo.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/noisedet.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/pnsparam.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/pre_echo_control.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/psy_configuration.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/psy_main.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/qc_main.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/quantize.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/sf_estim.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/spreading.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/tonality.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/transform.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/aacenc.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/aacenc_pns.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/aacEnc_ram.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/aacEnc_rom.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/aacenc_tns.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/adj_thr.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/adj_thr_data.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/band_nrg.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/bandwidth.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/bit_cnt.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/bitenc.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/block_switch.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/channel_map.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/chaosmeasure.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/dyn_bits.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/grp_data.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/intensity.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/interface.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/line_pe.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/metadata_compressor.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/metadata_main.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/mps_main.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/ms_stereo.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/noisedet.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/pns_func.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/pnsparam.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/pre_echo_control.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/psy_configuration.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/psy_const.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/psy_data.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/psy_main.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/qc_data.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/qc_main.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/quantize.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/sf_estim.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/spreading.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/tns_func.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/tonality.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/src/transform.h)

set(SYS_SRC
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSYS/src/genericStds.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSYS/src/syslib_channelMapDescr.cpp)

set(FDK_SRC
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/FDK_bitbuffer.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/FDK_core.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/FDK_crc.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/FDK_decorrelate.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/FDK_hybrid.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/FDK_lpc.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/FDK_matrixCalloc.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/FDK_qmf_domain.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/FDK_tools_rom.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/FDK_trigFcts.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/autocorr2nd.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/dct.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/fft.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/fft_rad2.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/fixpoint_math.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/huff_nodes.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/mdct.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/nlc_dec.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/qmf.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/src/scale.cpp)

set(MPEGTPENC_SRC
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libMpegTPEnc/src/tpenc_adif.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libMpegTPEnc/src/tpenc_adts.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libMpegTPEnc/src/tpenc_asc.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libMpegTPEnc/src/tpenc_latm.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libMpegTPEnc/src/tpenc_lib.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libMpegTPEnc/src/tp_version.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libMpegTPEnc/src/tpenc_adif.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libMpegTPEnc/src/tpenc_adts.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libMpegTPEnc/src/tpenc_asc.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libMpegTPEnc/src/tpenc_latm.h)

set(SBRENC_SRC
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/bit_sbr.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/code_env.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/env_bit.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/env_est.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/fram_gen.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/invf_est.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/mh_det.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/nf_est.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/ps_bitenc.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/ps_encode.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/ps_main.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/resampler.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/sbr_encoder.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/sbr_misc.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/sbrenc_freq_sca.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/sbrenc_ram.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/sbrenc_rom.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/ton_corr.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/tran_det.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/bit_sbr.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/cmondata.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/code_env.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/env_bit.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/env_est.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/fram_gen.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/invf_est.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/mh_det.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/nf_est.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/ps_bitenc.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/ps_const.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/ps_encode.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/ps_main.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/resampler.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/sbr.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/sbr_def.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/sbr_misc.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/sbrenc_freq_sca.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/sbrenc_ram.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/sbrenc_rom.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/ton_corr.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/src/tran_det.h)

set(SACENC_SRC
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_bitstream.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_delay.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_dmx_tdom_enh.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_filter.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_framewindowing.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_huff_tab.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_lib.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_nlc_enc.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_onsetdetect.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_paramextract.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_staticgain.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_tree.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_vectorfunctions.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_bitstream.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_const.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_delay.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_dmx_tdom_enh.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_filter.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_framewindowing.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_huff_tab.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_nlc_enc.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_onsetdetect.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_paramextract.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_staticgain.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_tree.h
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/src/sacenc_vectorfunctions.h)

set(PCMUTILS_SRC
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libPCMutils/src/limiter.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libPCMutils/src/pcm_utils.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libPCMutils/src/pcmdmx_lib.cpp
  ${PROJECT_SOURCE_DIR}/../src/fdk-aac/libPCMutils/src/version.h)

# add_library(fdk_aac STATIC ${SRC_FILES})
add_library(fdk_aac SHARED ${PCMUTILS_SRC} ${SACENC_SRC} ${SBRENC_SRC} ${MPEGTPENC_SRC} ${SYS_SRC} ${FDK_SRC} ${AACENC_SRC} ${SRC_FILES})

target_include_directories(fdk_aac PRIVATE
    "${PROJECT_SOURCE_DIR}/../src/fdk-aac/libFDK/include/"
    "${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSYS/include/"
    "${PROJECT_SOURCE_DIR}/../src/fdk-aac/libMpegTPEnc/include/"
    "${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSBRenc/include/"
    "${PROJECT_SOURCE_DIR}/../src/fdk-aac/libAACenc/include/"
    "${PROJECT_SOURCE_DIR}/../src/fdk-aac/libSACenc/include/"
    "${PROJECT_SOURCE_DIR}/../src/fdk-aac/libPCMutils/include/"
)

set_target_properties(fdk_aac PROPERTIES
    FRAMEWORK TRUE
    FRAMEWORK_VERSION A
    MACOSX_FRAMEWORK_IDENTIFIER com.fdk.aac
# MACOSX_FRAMEWORK_INFO_PLIST Info.plist
# "current version" in semantic format in Mach-O binary file
    VERSION 1.0.0
# "compatibility version" in semantic format in Mach-O binary file
    SOVERSION 1.0.0
    PUBLIC_HEADER fdk_aac.h
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "Apple Development"
    # RESOURCE "${RESOURCE_FILES}"
)