using Godot;
using System;

public partial class BaseAction : GodotObject
{

    private float Duration = 0.0f;
    private float TimeElapsed = 0.0f;
    protected float PercentComplete = 0.0f;
    protected string Name = "";

    public void _init(float duration, string name)
    {
        Duration = duration;
        Name = name;

    }

    public bool Act(float TimeStep)
    {
        // Early Exit so we don't divide by zero
        if(Duration == 0)
        {
            return true;
        }

        TimeElapsed += TimeStep;

        //TODO: Easing Function
        PercentComplete = TimeElapsed / Duration;

        if(TimeElapsed >= Duration)
        {
            return true;
        }

        //Indicate Action Still Processing
        return false;
    }
}
