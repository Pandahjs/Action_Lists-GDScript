using Godot;
using System;

public partial class ZIndex2D : BaseAction
{
    private int Start   = 0;
    private int End     = 0;
    private int Current = 0;

    private Node2D Target = null;

    // Initialization Function
    //
    // Target_   : What Node2D inherited object is being rotated
    // Duration_ : How long it should take to rotate (In Seconds)
    // Start_    : Where the Rotation should Start From 
    // End_      : Where the Rotation should End Up
    // isGlobal_ : Whether this is a Global or Local Rotation Change
    //
    public void _init(Node2D Target_, float Duration_, int Start_, int End_)
    {
        base._init(Duration_,"ZIndex2D");
        Start = Start_;
        Current = Start;
        End = End_;
        Target = Target_;
    }

    public override bool Act(float TimeStep)
    {
        bool AmDone = base.Act(TimeStep);

        Current = (int)(Start + ((End-Start) * PercentComplete));

        if(Target != null)
        {
            Target.ZIndex = Current;
        }

        return AmDone;
    }
}
