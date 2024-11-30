using Godot;
using System;

public partial class Move3D : BaseAction
{
    private Vector3 Start   = new Vector3(0,0,0);
    private Vector3 End     = new Vector3(0,0,0);
    private Vector3 Current = new Vector3(0,0,0);

    private Node3D Target = null;
    private bool isGlobal = false;

    // Initialization Function
    //
    // Target_   : What Node2D inherited object is being moved
    // Duration_ : How long it should take to Move (In Seconds)
    // Start_    : Where the Move should Start From 
    // End_      : Where the Move should End Up
    // isGlobal_ : Whether this is a Global or Local Position Change
    //
    public void _init(Node3D Target_, float Duration_, Vector3 Start_, Vector3 End_, bool isGlobal_ = false)
    {
        base._init(Duration_,"Move2D");
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
                Target.GlobalPosition = Current;
            else
                Target.Position = Current;
        }

        return AmDone;
    }
}
