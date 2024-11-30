using Godot;
using System;

public partial class Skew2D : BaseAction
{
    private float Start   = 0;
    private float End     = 0;
    private float Current = 0;

    private Node2D Target = null;
    private bool isGlobal = false;

    // Initialization Function
    //
    // Target_   : What Node2D inherited object is being rotated
    // Duration_ : How long it should take to rotate (In Seconds)
    // Start_    : Where the Rotation should Start From 
    // End_      : Where the Rotation should End Up
    // isGlobal_ : Whether this is a Global or Local Rotation Change
    //
    public void _init(Node2D Target_, float Duration_, float Start_, float End_, bool isGlobal_ = false)
    {
        base._init(Duration_,"Skew2D");
        Start = Start_;
        Current = Start;
        End = End_;
        Target = Target_;
        isGlobal = isGlobal_;
    }

    public override bool Act(float TimeStep)
    {
        bool AmDone = base.Act(TimeStep);

        Current = Start + ((End-Start) * PercentComplete);

        if(Target != null)
        {
            if(isGlobal)
                Target.GlobalSkew = Current;
            else
                Target.Skew = Current;
        }

        return AmDone;
    }
}
