using Godot;
using System;

public partial class MoveControl : BaseAction
{
    private Vector2 Start   = new Vector2(0,0);
    private Vector2 End     = new Vector2(0,0);
    private Vector2 Current = new Vector2(0,0);

    private Control Target = null;

    // Initialization Function
    //
    // Target_   : What Node2D inherited object is being moved
    // Duration_ : How long it should take to Move (In Seconds)
    // Start_    : Where the Move should Start From 
    // End_      : Where the Move should End Up
    //
    public void _init(Control Target_, float Duration_, Vector2 Start_, Vector2 End_)
    {
        base._init(Duration_,"Move2D");
        Start = Start_;
        Current = Start;
        End = End_;
        Target = Target_;
    }

    public override bool Act(float TimeStep)
    {
        bool AmDone = base.Act(TimeStep);

        Current = Start + ((End-Start) * PercentComplete);

        if(Target != null)
        {                
            Target.Position = Current;
        }

        return AmDone;
    }
}
