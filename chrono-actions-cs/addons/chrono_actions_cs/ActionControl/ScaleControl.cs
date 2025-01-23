using Godot;
using System;

public partial class ScaleControl : BaseAction
{
    private Vector2 Start   = new Vector2(0,0);
    private Vector2 End     = new Vector2(0,0);
    private Vector2 Current = new Vector2(0,0);

    private Control Target = null;

    // Initialization Function
    //
    // Target_   : What Control inherited object is being scaled
    // Duration_ : How long it should take to Scale (In Seconds)
    // Start_    : Where the Scale should Start From 
    // End_      : Where the Scale should End Up
    //
    public void _init(Control Target_, float Duration_, Vector2 Start_, Vector2 End_)
    {
        base._init(Duration_,"Scale2D");
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
            Target.Scale = Current;
        }

        return AmDone;
    }
}
