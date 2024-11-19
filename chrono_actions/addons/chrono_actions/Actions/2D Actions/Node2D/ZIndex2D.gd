######################################################################################
##
##      File: ZIndex2D.gd
##    Author: Harris Sinclair
## Last Edit: 2024-11-16
##     Brief: This file defines a Skew Action in 2D for the ChronoActions system
##
######################################################################################
@tool
extends BaseAction

class_name ZIndex2D

var Start   : float = 0 
var End     : float = 0
var Current : float = 0

var Target    : Node2D = null

# Initialization Function
#
# Target_    : What Node2D inherited object is having it's Z Index Changed
# Duration_  : How long it should take to Change Z Index (In Seconds)
# Start_     : Where the Z Index should Start  
# End_       : Where the Z Index should End Up
#
func _init(Target_ : Node2D, Duration_ : float, Start_ : float, End_ : float):
    super._init(Duration_, "ZIndex2D")
    Target    = Target_
    Start     = Start_
    Current   = Start_
    End       = End_

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
        Target.z_index = Current

    return AmDone