######################################################################################
##
##      File: MoveControl.gd
##    Author: Harris Sinclair
## Last Edit: 2024-11-16
##     Brief: This file defines a Move Action in 2D for the ChronoActions system
##
######################################################################################
@tool
extends BaseAction

class_name MoveControl

var Start   := Vector2(0,0)
var End     := Vector2(0,0)
var Current := Vector2(0,0)

var Target   : Control = null
var isGlobal : bool = false 

# Initialization Function
#
# Target_   : What Node2D inherited object is being moved
# Duration_ : How long it should take to Move (In Seconds)
# Start_    : Where the Move should Start From 
# End_      : Where the Move should End Up
# isGlobal_ : Whether this is a Global or Local Position Change
#
func _init(Target_ : Control, Duration_ : float, Start_ : Vector2, End_ : Vector2, isGlobal_:bool = false):
    super._init(Duration_, "MoveControl")
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
            Target.global_position = Current
        else:
            Target.position = Current

    return AmDone