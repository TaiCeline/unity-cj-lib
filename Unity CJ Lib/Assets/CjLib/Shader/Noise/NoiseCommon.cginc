﻿/******************************************************************************/
/*
  Project - Unity CJ Lib
            https://github.com/TheAllenChou/unity-cj-lib

  Author  - Ming-Lun "Allen" Chou
  Web     - http://AllenChou.net
  Twitter - @TheAllenChou

  Based on Noise Shader Library for Unity
  https://github.com/keijiro/NoiseShader

  Original work (webgl-noise) Copyright (C) 2011 Ashima Arts.
  Translation and modification was made by Keijiro Takahashi.

    Description : Array and textureless GLSL 2D simplex noise function.
        Author  : Ian McEwan, Ashima Arts.
    Maintainer  : ijm
        Lastmod : 20110822 (ijm)
        License : Copyright (C) 2011 Ashima Arts. All rights reserved.
                  Distributed under the MIT License. See LICENSE file.
                  https://github.com/ashima/webgl-noise
*/
/******************************************************************************/


#ifndef NOISE_COMMON
#define NOISE_COMMON

float mod(float x, float y)
{
  return x - y * floor(x / y);
}

float2 mod(float2 x, float2 y)
{
  return x - y * floor(x / y);
}

float3 mod(float3 x, float3 y)
{
  return x - y * floor(x / y);
}

float4 mod(float4 x, float4 y)
{
  return x - y * floor(x / y);
}

float2 mod289(float2 x)
{
  return x - floor(x / 289.0) * 289.0;
}

float3 mod289(float3 x)
{
  return x - floor(x / 289.0) * 289.0;
}

float4 mod289(float4 x)
{
  return x - floor(x / 289.0) * 289.0;
}

float3 permute(float3 x)
{
  return mod289((x * 34.0 + 1.0) * x);
}

float4 permute(float4 x)
{
  return mod289((x * 34.0 + 1.0) * x);
}

float3 taylorInvSqrt(float3 r)
{
  return 1.79284291400159 - 0.85373472095314 * r;
}

float4 taylorInvSqrt(float4 r)
{
  return 1.79284291400159 - 0.85373472095314 * r;
}

float2 fade(float2 t)
{
  return t * t * t * (t * (t * 6.0 - 15.0) + 10.0);
}

float3 fade(float3 t)
{
  return t * t * t * (t * (t * 6.0 - 15.0) + 10.0);
}


#define DEFINE_NOISE_FUNC_MULTIPLE_OCTAVES(NOISE_FUNC, RET_TYPE, PARAM_TYPE)            \
RET_TYPE NOISE_FUNC                                                                     \
(                                                                                       \
  PARAM_TYPE s,                                                                         \
  PARAM_TYPE offset,                                                                    \
  uint numOctaves,                                                                      \
  float octaveOffsetFactor                                                              \
)                                                                                       \
{                                                                                       \
  RET_TYPE o = 0.5;                                                                     \
  float w = 0.5;                                                                        \
  for (uint i = 0; i < numOctaves; ++i)                                                 \
  {                                                                                     \
    o += w * NOISE_FUNC(s + offset);                                                    \
    offset *= 2.0 * octaveOffsetFactor;                                                 \
    s *= 2.0;                                                                           \
    w *= 0.5;                                                                           \
  }                                                                                     \
  return o;                                                                             \
}

#define DEFINE_PERIODIC_NOISE_FUNC_MULTIPLE_OCTAVES(NOISE_FUNC, RET_TYPE, PARAM_TYPE)   \
RET_TYPE NOISE_FUNC                                                                     \
(                                                                                       \
  PARAM_TYPE s,                                                                         \
  PARAM_TYPE offset,                                                                    \
  PARAM_TYPE period,                                                                    \
  uint numOctaves,                                                                      \
  float octaveOffsetFactor                                                              \
)                                                                                       \
{                                                                                       \
  RET_TYPE o = 0.5;                                                                     \
  float w = 0.5;                                                                        \
  for (uint i = 0; i < numOctaves; ++i)                                                 \
  {                                                                                     \
    o += w * NOISE_FUNC(s + offset, period);                                            \
    offset *= 2.0 * octaveOffsetFactor;                                                 \
    period *= 2.0;                                                                      \
    s *= 2.0;                                                                           \
    w *= 0.5;                                                                           \
  }                                                                                     \
  return o;                                                                             \
}


#endif
