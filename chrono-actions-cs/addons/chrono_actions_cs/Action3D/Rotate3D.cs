using Godot;
using System;

public partial class Rotate3D : BaseAction
{
    private Quaternion Start;
    private Quaternion End;
    private Quaternion Current;

    private Node3D Target = null;
    private bool isGlobal = false;

    public Vector3 X_AXIS = new Vector3(1,0,0);
    public Vector3 Y_AXIS = new Vector3(0,1,0);
    public Vector3 Z_AXIS = new Vector3(0,0,1);

    // Initialization Function
    //
    // Target_    : What Node3D inherited object is being rotated
    // Duration_  : How long it should take to Rotate (In Seconds)
    // Axis_      : What Axis is being rotated around
    // Angle_     : How Much to Rotate Around the Axis
    // isDegrees_ : Whether the passed values are in Degrees (True) or Radians (False)
    //
    public void _init(Node3D Target_, float Duration_, Vector3 Axis_, float Angle_, bool isDegrees_ = true)
    {
        base._init(Duration_,"Rotate3D");
        Target = Target_;

        float end_rotation = (isDegrees_)?Mathf.DegToRad(Angle_):Angle_;

        Start = Target.Transform.Basis.GetRotationQuaternion();
        End = new Quaternion(Axis_,end_rotation);
        Current = Start;
    }

    public override bool Act(float TimeStep)
    {
        bool AmDone = base.Act(TimeStep);

        Current = Start.Slerp(End,PercentComplete);

        if(Target != null)
        {
            // Illegal, can not assign to Basis like this...why?!
            //Target.Transform.Basis = new Basis(Current);
            Transform3D targetCurrent = Target.Transform;
            targetCurrent.Basis = new Basis(Current);
            Target.Transform = targetCurrent;
        }

        return AmDone;
    }
}
