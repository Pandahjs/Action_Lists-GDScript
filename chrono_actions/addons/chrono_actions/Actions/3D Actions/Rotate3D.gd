################################################################################
##
##      File: Rotate3D.gd
##    Author: Harris Sinclair
##     Brief: This file defines a Rotate Action in 2D for the ChronoActions system
##
################################################################################
##
## Shout outs here to 3Blue1Brown and Ben Eater for this stuff.
## 
## Quaternions are a *weird* mathematical model that give me a headache.
## Even interacting with them in Godot is frustrating.
##
## Their interactive video sets on this stuff really help me understand it.
##
## Check it out here: https://eater.net/quaternions
##
@tool
extends BaseAction

class_name Rotate3D

var Start   : Quaternion 
var End     : Quaternion
var Current : Quaternion

var Target    : Node3D = null
var isGlobal  : bool   = false 

static var X_Axis := Vector3(1,0,0)
static var Y_Axis := Vector3(0,1,0)
static var Z_Axis := Vector3(0,0,1)

# Initialization Function
#
# Target_    : What Node2D inherited object is being rotated
# Duration_  : How long it should take to Rotate (In Seconds)
# Axis_      : What Axis is being rotated around
# Angle_     : How Much to Rotate Around the Axis
# isGlobal_  : Whether this is a Global or Local Rotation Change
# isDegrees_ : Whether the passed values are in Degrees (True) or Radians (False)
#
func _init(Target_ : Node3D, Duration_ : float, Axis_:Vector3, Angle_ : float, isDegrees_ : bool = true):
    super._init(Duration_, "Rotate3D")
    Target    = Target_

    var rotate_end = 0
    if isDegrees_:
        rotate_end   = deg_to_rad(Angle_)
    else:
        rotate_end   = Angle_

    Start = Target.transform.basis
    End = Quaternion(Axis_, rotate_end)

    Current = Start

# Act Function
#
# Overrides the Base Action Act Function. Invokes the Base Action Function
# in order to progress along itself through time.
#
# TimeStep : How much time since this action was called last.
#
func Act(TimeStep : float) -> bool:
    var AmDone = super.Act(TimeStep)

    # This is one of the exceptions to our usual Linear Interpolation
    # Because Rotation in 3D is....complicated....
    Current = Start.slerp(End,PercentComplete)

    if Target != null:
        Target.transform.basis = Basis(Current)

    return AmDone