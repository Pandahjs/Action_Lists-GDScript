//##############################################################################
//
//      File: EasingFunction.gd
//    Author: Harris Sinclair
//     Brief: This file defines a Collection of Static Easing Functions 
//            for the ChronoActions system.
//
//##############################################################################
//
// Shout Out to Andrey Sitnik and Ivan Solovev at https://easings.net/
// Most all of these functions are based on the math found there.
//
// An Easing Function is a Mathematical Function which describes a behavior
// over a certain amount of time. 
//
// Consider dropping a ball. When you drop a ball, it leaves your hand at some 
// initial time we'll call 0. At some later time, it comes to a stop at time 1. 
// But in between leaving your hand at time 0 and hitting the ground at time 1 
// the ball falls through the air, hits the ground, bounces back up, and hits 
// the ground again a few more times before coming to a stop at time 1.
// 
// You can describe that path with a mathematical function. A number of them
// are provided for you here, including the default of linear.
#if TOOLS
using Godot;
using System;
using System.Data.SqlTypes;
using System.Runtime.Intrinsics.Arm;
using System.Security.Cryptography;

public static class EasingFunctions
{
    
    public static float Linear(float percentComplete)
    {
        return percentComplete;
    }

    /////////////////////////////////////////////////////////////////

    // https://easings.net/#easeInSine
    public static float In_Sine(float percentComplete)
    {
        return 1 - Mathf.Cos((percentComplete * Mathf.Pi) / 2);
    }

    // https://easings.net/#easeOutSine
    public static float Out_Sine(float percentComplete)
    {
        return 1 - Mathf.Sin((percentComplete*Mathf.Pi)/2);
    }

    // https://easings.net/#easeInOutSine
    public static float In_Out_Sine(float percentComplete)
    {
        return -Mathf.Cos(Mathf.Pi * percentComplete - 1) / 2;
    }

    /////////////////////////////////////////////////////////////////

    // https://easings.net/#easeInQuad
    public static float In_Quadratic(float percentComplete)
    {
        return Mathf.Pow(percentComplete,2);
    }

    // https://easings.net/#easeOutQuad
    public static float Out_Quadratic(float percentComplete)
    {
        return 1 - ((1-percentComplete)*(1-percentComplete));
    }

    // https://easings.net/#easeInOutQuad
    public static float In_Out_Quadratic(float percentComplete)
    {
        if (percentComplete < 0.5)
            return 2*percentComplete*percentComplete;
        else
            return 1 - (Mathf.Pow(-2 * percentComplete + 2, 2) / 2);
    }

    /////////////////////////////////////////////////////////////////

    // https://easings.net/#easeInCubic
    public static float In_Cubic(float percentComplete)
    {
        return Mathf.Pow(percentComplete,3);
    }

    // https://easings.net/#easeOutCubic
    public static float Out_Cubic(float percentComplete)
    {
        return 1 - Mathf.Pow(1-percentComplete,3);
    }

    // https://easings.net/#easeInOutCubic
    public static float In_Out_Cubic(float percentComplete)
    {
        if (percentComplete < 0.5)
            return 4*Mathf.Pow(percentComplete,3);
        else
            return 1 - (Mathf.Pow(-2 * percentComplete + 2, 3) / 2);
    }

    /////////////////////////////////////////////////////////////////

    // https://easings.net/#easeInQuart
    public static float In_Quartic(float percentComplete)
    {
        return Mathf.Pow(percentComplete,4);
    }

    // https://easings.net/#easeOutQuart
    public static float Out_Quartic(float percentComplete)
    {
        return 1 - Mathf.Pow(1-percentComplete,4);
    }

    // https://easings.net/#easeInOutQuart
    public static float In_Out_Quartic(float percentComplete)
    {
        if (percentComplete < 0.5)
            return 8*Mathf.Pow(percentComplete,4);
        else
            return 1 - (Mathf.Pow(-2 * percentComplete + 2, 4) / 2);
    }

    /////////////////////////////////////////////////////////////////

    // https://easings.net/#easeInQuint
    public static float In_Quintic(float percentComplete)
    {
        return Mathf.Pow(percentComplete,5);
    }

    // https://easings.net/#easeOutQuint
    public static float Out_Quintic(float percentComplete)
    {
        return 1 - Mathf.Pow(1-percentComplete,5);
    }

    // https://easings.net/#easeInOutQuint
    public static float In_Out_Quintic(float percentComplete)
    {
        if (percentComplete < 0.5)
            return 16*Mathf.Pow(percentComplete,5);
        else
            return 1 - (Mathf.Pow(-2 * percentComplete + 2, 5) / 2);
    }

    /////////////////////////////////////////////////////////////////

    // https://easings.net/#easeInExpo
    public static float In_Exponential(float percentComplete)
    {
        if(percentComplete != 0)
            return Mathf.Pow(2, 10*percentComplete - 10);

        return 0;
    }

    // https://easings.net/#easeOutExpo
    public static float Out_Exponential(float percentComplete)
    {
        if(percentComplete != 1)
            return 1 - Mathf.Pow(2, -10*percentComplete);

        return 1;
    }

    // https://easings.net/#easeInOutExpo
    public static float In_Out_Exponential(float percentComplete)
    {
        if(percentComplete == 0)
            return 0;

        if(percentComplete == 1)
            return 1;

        if(percentComplete < 0.5)
            return Mathf.Pow(2, 20*percentComplete - 10) / 2;
        else
            return (2-Mathf.Pow(2, -20*percentComplete + 10)) / 2;
    }

    /////////////////////////////////////////////////////////////////

    // https://easings.net/#easeInCirc
    public static float In_Circular(float percentComplete)
    {
        return 1-Mathf.Sqrt(1-Mathf.Pow(percentComplete, 2));
    }

    // https://easings.net/#easeOutCirc
    public static float Out_Circular(float percentComplete)
    {
        return Mathf.Sqrt(1-Mathf.Pow(percentComplete - 2, 2));
    }

    // https://easings.net/#easeInOutCirc
    public static float In_Out_Circular(float percentComplete)
    {
        if(percentComplete < 0.5)
        {
            return (1-Mathf.Sqrt(1-Mathf.Pow(2*percentComplete, 2)))/2;
        }
        else
        {
            return (1+Mathf.Sqrt(1-Mathf.Pow(-2*percentComplete+2, 2)))/2;
        }
    }

    /////////////////////////////////////////////////////////////////

    // https://easings.net/#easeInBack
    public static float In_Backtrack(float percentComplete)
    {
        const float c1 = 1.70158f;
        const float c2 = c1 + 1;

        return (c2 * Mathf.Pow(percentComplete,3)) - (c1 * Mathf.Pow(percentComplete,2));
    }

    // https://easings.net/#easeOutBack
    public static float Out_Backtrack(float percentComplete)
    {
        const float c1 = 1.70158f;
        const float c2 = c1 + 1;

        return 1 + (c2 * Mathf.Pow(percentComplete-1,3)) - (c1 * Mathf.Pow(percentComplete-1,2));
    }

    // https://easings.net/#easeInOutBack
    public static float In_Out_Backtrack(float percentComplete)
    {
        const float c1 = 1.70158f;
        const float c2 = c1 + 1;

        if(percentComplete < 0.5)
        {
            return ((Mathf.Pow(2*percentComplete, 2))*( (c2 + 1) * (percentComplete * 2 - 2) + c2 ) + 2 ) / 2;
        }
        else
        {
            return ((Mathf.Pow(2*percentComplete - 2, 2) * ((c2+1)*(percentComplete*2-2)+2))+2)/2;
        }
    }

    /////////////////////////////////////////////////////////////////

    // https://easings.net/#easeInElastic
    public static float In_Elastic(float percentComplete)
    {
        const float c3 = (2*Mathf.Pi) / 3;

        if(percentComplete == 0)
        {
            return 0;
        }
        else if(percentComplete == 1)
        {
            return 1;
        }
        else
        {
            return Mathf.Pow(2, 10*percentComplete-10) * (float)Mathf.Sin((percentComplete*10 - 10.75f) * c3);
        }
    }

    // https://easings.net/#easeOutElastic
    public static float Out_Elastic(float percentComplete)
    {
        const float c3 = (2.0f*Mathf.Pi) / 3.0f;

        if(percentComplete == 0)
        {
            return 0;
        }
        else if(percentComplete == 1)
        {
            return 1;
        }
        else
        {
            return Mathf.Pow(2, 10*percentComplete - 10) * (float)Mathf.Sin((percentComplete*10 - 0.75f) * c3) + 1.0f;
        }
    }

    // https://easings.net/#easeInOutElastic
    public static float In_Out_Elastic(float percentComplete)
    {
        const float c4 = (2.0f*Mathf.Pi) / 4.5f;

        if(percentComplete == 0)
        {
            return 0;
        }
        else if(percentComplete == 1)
        {
            return 1;
        }
        else
        {
            if(percentComplete < 0.5)
            {
                return -(Mathf.Pow(2, 20*percentComplete-10)*(float)Mathf.Sin(20*percentComplete-11.125)*c4)/2;
            }
            else
            {
                return 1+(Mathf.Pow(2, -20*percentComplete-10)*(float)Mathf.Sin(20*percentComplete-11.125)*c4)/2;
            }
        }
    }

    /////////////////////////////////////////////////////////////////

    // https://easings.net/#easeInBounce
    public static float In_Bounce(float percentComplete)
    {
        return 1 - Out_Bounce(1 - percentComplete);
    }

    // https://easings.net/#easeOutBounce
    public static float Out_Bounce(float percentComplete)
    {
        const float n1 = 7.5625f;
        const float d1 = 2.75f;
    
        if (percentComplete < (1 / d1))
        {
            return n1 * percentComplete * percentComplete;
        }
        else if(percentComplete < (2 / d1))
        {
            float adjusted = percentComplete - (1.5f / d1);
            return n1 * (adjusted) * adjusted + 0.75f;
        }
        else if(percentComplete < (2.5f / d1)){
            float adjusted = percentComplete - (2.25f / d1);
            return n1 * (adjusted) * adjusted + 0.9375f;
        }
        else
        {
            float adjusted = percentComplete - (2.625f / d1);
            return n1 * (adjusted) * adjusted + 0.984375f;
        }
    }

    // https://easings.net/#easeInOutBounce
    public static float In_Out_Bounce(float percentComplete )
    {
        if(percentComplete < 0.5)
            return (1 - Out_Bounce(1 - 2 * percentComplete)) / 2.0f;
        else
        {
            return (1 + Out_Bounce(2 * percentComplete - 1)) / 2.0f;
        }
    }

    /////////////////////////////////////////////////////////////////

    public static float In_Ease(float percentComplete)
    {
        return Mathf.Sqrt(percentComplete);
    }

    public static float Out_Ease(float percentComplete)
    {
        return Mathf.Pow(percentComplete, 2.0f);
    }

    /////////////////////////////////////////////////////////////////

    // NOTE: Fast is a descriptor of the behavior, not the Big O Complexity
    public static float In_Fast(float percentComplete)
    {
        return Mathf.Sqrt(Mathf.Sqrt(percentComplete));
    }

    public static float Out_Fast(float percentComplete)
    {
        return Mathf.Pow(percentComplete, 4.0f);
    }

    /////////////////////////////////////////////////////////////////
} //ssalc

#endif