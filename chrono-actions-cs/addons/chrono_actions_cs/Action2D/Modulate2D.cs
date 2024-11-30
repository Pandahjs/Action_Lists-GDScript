using Godot;
using System;

public partial class Modulate2D : BaseAction
{
    private Color Start   = new Color(0,0,0,0);
    private Color End     = new Color(0,0,0,0);
    private Color Current = new Color(0,0,0,0);

    private Node2D Target = null;
    private bool isAllChildren = false;

    // Initialization Function
    //
    // Target_   : What Node2D inherited object is being moved
    // Duration_ : How long it should take to Move (In Seconds)
    // Start_    : Where the Move should Start From 
    // End_      : Where the Move should End Up
    // isGlobal_ : Whether this is a Global or Local Position Change
    //
    public void _init(Node2D Target_, float Duration_, Color Start_, Color End_, bool isAllChildren_ = false)
    {
        base._init(Duration_,"Modulate2D");
        Start = Start_;
        Current = Start;
        End = End_;
        Target = Target_;
        isAllChildren = isAllChildren_;
    }

    public override bool Act(float TimeStep)
    {
        bool AmDone = base.Act(TimeStep);

        Current = Start + ((End-Start) * PercentComplete);

        if(Target != null)
        {
            if(isAllChildren)
                Target.Modulate = Current;
            else
                Target.SelfModulate = Current;
        }

        return AmDone;
    }
}
