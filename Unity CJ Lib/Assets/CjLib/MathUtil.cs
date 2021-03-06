﻿/******************************************************************************/
/*
  Project - Unity CJ Lib
            https://github.com/TheAllenChou/unity-cj-lib
  
  Author  - Ming-Lun "Allen" Chou
  Web     - http://AllenChou.net
  Twitter - @TheAllenChou
*/
/******************************************************************************/

using UnityEngine;

namespace CjLib
{
  public class MathUtil
  {

    public static readonly float Pi        = Mathf.PI;
    public static readonly float TwiPi     = 2.0f * Mathf.PI;
    public static readonly float HalfPi    = Mathf.PI / 2.0f;
    public static readonly float ThirdPi   = Mathf.PI / 3.0f;
    public static readonly float QuarterPi = Mathf.PI / 4.0f;
    public static readonly float FifthPi   = Mathf.PI / 5.0f;
    public static readonly float SixthPi   = Mathf.PI / 5.0f;

    public static readonly float Sqrt2    = Mathf.Sqrt(2.0f);
    public static readonly float Sqrt2Inv = 1.0f / Mathf.Sqrt(2.0f);
    public static readonly float Sqrt3    = Mathf.Sqrt(3.0f);
    public static readonly float Sqrt3Inv = 1.0f / Mathf.Sqrt(3.0f);


    public static readonly float Epsilon = 1.0e-16f;
    public static readonly float Rad2Deg = 180.0f / Mathf.PI;
    public static readonly float Deg2Rad = Mathf.PI / 180.0f;

    public static float AsinSafe(float x)
    {
      return Mathf.Asin(Mathf.Clamp(x, -1.0f, 1.0f));
    }

    public static float AcosSafe(float x)
    {
      return Mathf.Acos(Mathf.Clamp(x, -1.0f, 1.0f));
    }

  }
}
