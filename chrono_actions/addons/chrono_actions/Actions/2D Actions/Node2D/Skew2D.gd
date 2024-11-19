######################################################################################
##
##      File: Skew2D.gd
##    Author: Harris Sinclair
## Last Edit: 2024-11-16
##     Brief: This file defines a Skew Action in 2D for the ChronoActions system
##
######################################################################################
@tool
extends BaseAction

class_name Skew2D

var Start   : float = 0 
var End     : float = 0
var Current : float = 0

var Target    : Node2D = null
var isGlobal  : bool   = false

# Initialization Function
#
# Target_    : What Node2D inherited object is being skewed
# Duration_  : How long it should take to Skew (In Seconds)
# Start_     : Where the Skew should Start  
# End_       : Where the Skew should End Up
# isGlobal_  : If this is a global or local Skew
#
func _init(Target_ : Node2D, Duration_ : float, Start_ : float, End_ : float, \
            isGlobal_:bool = false):
    super._init(Duration_, "Skew2D")
    Target    = Target_
    Start     = Start_
    Current   = Start_
    End       = End_
    isGlobal  = isGlobal_

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
            Target.global_skew = Current
        else:
            Target.skew = Current

    return AmDone