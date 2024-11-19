######################################################################################
##
##      File: ScaleControl.gd
##    Author: Harris Sinclair
## Last Edit: 2024-11-16
##     Brief: This file defines a Scale Action in 2D for the ChronoActions system
##
######################################################################################
@tool
extends BaseAction

class_name ScaleControl

var Start   := Vector2(0,0)
var End     := Vector2(0,0)
var Current := Vector2(0,0)

var Target   : Control = null
var isGlobal : bool = false 

# Initialization Function
#
# Target_   : What Control inherited object is being scaled
# Duration_ : How long it should take to Scale (In Seconds)
# Start_    : What size the Scale should Start  
# End_      : How big the Scale should End Up
# isGlobal_ : Whether this is a Global or Local Scale Change
#
func _init(Target_ : Control, Duration_ : float, Start_ : Vector2, End_ : Vector2, isGlobal_:bool = false):
    super._init(Duration_, "ScaleControl")
    Target   = Target_
    Start    = Start_
    Current  = Start_
    End      = End_
    isGlobal = isGlobal_

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
            Target.global_scale = Current
        else:
            Target.scale = Current

    return AmDone