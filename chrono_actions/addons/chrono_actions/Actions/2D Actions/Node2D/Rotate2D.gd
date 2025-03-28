######################################################################################
##
##      File: Rotate2D.gd
##    Author: Harris Sinclair
## Last Edit: 2024-11-16
##     Brief: This file defines a Rotate Action in 2D for the ChronoActions system
##
######################################################################################
@tool
extends BaseAction

class_name Rotate2D

var Start   :float= 0 
var End     :float= 0
var Current :float= 0

var Target    : Node2D = null
var isGlobal  : bool   = false 
var isDegrees : bool   = true

# Initialization Function
#
# Target_    : What Node2D inherited object is being rotated
# Duration_  : How long it should take to Rotate (In Seconds)
# Start_     : Where the Rotate should Start  
# End_       : Where the Rotation should End Up
# isGlobal_  : Whether this is a Global or Local Rotation Change
# isDegrees_ : Whether the passed values are in Degrees (True) or Radians (False)
#
func _init(Target_ : Node2D, Duration_ : float, Start_ : float, End_ : float, \
            isGlobal_:bool = false, isDegrees_ : bool = true):
    super._init(Duration_, "Rotate2D")
    Target    = Target_
    Start     = Start_
    Current   = Start_
    End       = End_
    isGlobal  = isGlobal_
    isDegrees = isDegrees_

# Act Function
#
# Overrides the Base Action Act Function. Invokes the Base Action Function
# in order to progress along itself through time.
#
# TimeStep : How much time since this action was called last.
#
func Act(TimeStep : float) -> bool:
    var AmDone = super.Act(TimeStep)

    # Because Easing is Handled by the Base Action, we can (almost) always 
    # write a simple linear interpolation and let easing handle edge cases.
    Current = Start + ((End - Start) * PercentComplete)

    if Target != null:
        if isGlobal:
            if isDegrees:
                Target.global_rotation_degrees = Current
            else:
                Target.global_rotation = Current
        else:
            if isDegrees:
                Target.rotation_degrees = Current
            else:
                Target.rotation = Current

    return AmDone