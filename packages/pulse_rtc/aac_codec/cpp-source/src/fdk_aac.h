#include <stdint.h>
#include "aac_encode.h"

#ifdef __cplusplus
extern "C"
{
#endif
    __attribute__((visibility("default"))) __attribute__((used))
    int32_t
    native_add(int32_t x, int32_t y);
    void pcmToAACBytes(uint8_t *pcm_bytes, uint8_t *aac_bytes, int32_t pcm_byte_count, int32_t* p_aac_byte_count, int32_t channels);
#ifdef __cplusplus
}
#endif
