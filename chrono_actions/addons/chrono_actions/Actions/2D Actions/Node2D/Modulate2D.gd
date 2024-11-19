######################################################################################
##
##      File: Modulate2D.gd
##    Author: Harris Sinclair
## Last Edit: 2024-11-16
##     Brief: This file defines a Skew Action in 2D for the ChronoActions system
##
######################################################################################
@tool
extends BaseAction

class_name Modulate2D

var Start   : Color = 0 
var End     : Color = 0
var Current : Color = 0

var Target    : Node2D = null
var isSelfOnly  : bool   = false

# Initialization Function
#
# Target_      : What Node2D inherited object is being Color Modulated
# Duration_    : How long it should take to Modulate the Color (In Seconds)
# Start_       : Where the Color Modulation should Start  
# End_         : Where the Color Modulation should End Up
# isSelfOnly_  : If this affects only this Node or it's children as well
#
func _init(Target_ : Node2D, Duration_ : float, Start_ : Color, End_ : Color, \
            isSelfOnly_:bool = false):
    super._init(Duration_, "Modulate2D")
    Target    = Target_
    Start     = Start_
    Current   = Start_
    End       = End_
    isSelfOnly  = isSelfOnly_

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
        if isSelfOnly:
            Target.self_modulate = Current
        else:
            Target.modulate = Current

    return AmDone