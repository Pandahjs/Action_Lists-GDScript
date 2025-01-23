using Godot;
using System;

public partial class RotateControl : BaseAction
{
    private float Start   = 0;
    private float End     = 0;
    private float Current = 0;

    private Control Target = null;

    // Initialization Function
    //
    // Target_   : What Control inherited object is being rotated
    // Duration_ : How long it should take to rotate (In Seconds)
    // Start_    : Where the Rotation should Start From 
    // End_      : Where the Rotation should End Up
    //
    public void _init(Control Target_, float Duration_, float Start_, float End_, bool isDegrees_ = false)
    {
        base._init(Duration_,"Rotate2D");
        Start = (isDegrees_) ? Mathf.DegToRad(Start_) : Start_;
        Current = Start;
        End = (isDegrees_) ? Mathf.DegToRad(End_) : End_;
        Target = Target_;
    }

    public override bool Act(float TimeStep)
    {
        bool AmDone = base.Act(TimeStep);

        Current = Start + ((End-Start) * PercentComplete);

        if(Target != null)
        {
            Target.Rotation = Current;
        }

        return AmDone;
    }
}
