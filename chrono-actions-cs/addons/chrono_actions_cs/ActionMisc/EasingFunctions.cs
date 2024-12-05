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

    // TODO Add the rest of the easing functions

} //ssalc

#endif