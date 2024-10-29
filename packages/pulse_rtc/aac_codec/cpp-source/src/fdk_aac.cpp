#include "fdk_aac.h"
#include <stdint.h>

extern "C" __attribute__((visibility("default"))) __attribute__((used)) int32_t
native_add(int32_t x, int32_t y) {
  return x + y;
}

extern "C" __attribute__((visibility("default"))) __attribute__((used)) void
pcmToAACBytes(uint8_t *pcm_bytes, uint8_t *aac_bytes, int32_t pcm_byte_count, int32_t *p_aac_byte_count, int32_t channels)
{
  aac_encode_pcm_bytes(pcm_bytes, aac_bytes, pcm_byte_count, p_aac_byte_count, channels);
}