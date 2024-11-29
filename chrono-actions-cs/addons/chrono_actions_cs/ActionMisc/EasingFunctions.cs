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

    public static float In_Quadratic(float percentComplete)
    {
        return Mathf.Pow(percentComplete,2);
    }

    public static float Out_Quadratic(float percentComplete)
    {
        return 1 - ((1-percentComplete)*(1-percentComplete));
    }

    public static float In_Out_Quadratic(float percentComplete)
    {
        if (percentComplete < 0.5)
            return 2*percentComplete*percentComplete;
        else
            return 1 - (Mathf.Pow(-2 * percentComplete + 2, 2) / 2);
    }

    /////////////////////////////////////////////////////////////////

    public static float In_Cubic(float percentComplete)
    {
        return Mathf.Pow(percentComplete,3);
    }

    public static float Out_Cubic(float percentComplete)
    {
        return 1 - Mathf.Pow(1-percentComplete,3);
    }

    public static float In_Out_Cubic(float percentComplete)
    {
        if (percentComplete < 0.5)
            return 4*Mathf.Pow(percentComplete,3);
        else
            return 1 - (Mathf.Pow(-2 * percentComplete + 2, 3) / 2);
    }

    /////////////////////////////////////////////////////////////////

    public static float In_Quartic(float percentComplete)
    {
        return Mathf.Pow(percentComplete,4);
    }

    public static float Out_Quartic(float percentComplete)
    {
        return 1 - Mathf.Pow(1-percentComplete,4);
    }

    public static float In_Out_Quartic(float percentComplete)
    {
        if (percentComplete < 0.5)
            return 8*Mathf.Pow(percentComplete,4);
        else
            return 1 - (Mathf.Pow(-2 * percentComplete + 2, 4) / 2);
    }

    /////////////////////////////////////////////////////////////////

    public static float In_Quintic(float percentComplete)
    {
        return Mathf.Pow(percentComplete,5);
    }

    public static float Out_Quintic(float percentComplete)
    {
        return 1 - Mathf.Pow(1-percentComplete,5);
    }

    public static float In_Out_Quintic(float percentComplete)
    {
        if (percentComplete < 0.5)
            return 16*Mathf.Pow(percentComplete,5);
        else
            return 1 - (Mathf.Pow(-2 * percentComplete + 2, 5) / 2);
    }

    /////////////////////////////////////////////////////////////////

    public static float In_Exponential(float percentComplete)
    {
        if(percentComplete != 0)
            return Mathf.Pow(2, 10*percentComplete - 10);

        return 0;
    }

    public static float Out_Exponential(float percentComplete)
    {
        if(percentComplete != 1)
            return 1 - Mathf.Pow(2, -10*percentComplete);

        return 1;
    }

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