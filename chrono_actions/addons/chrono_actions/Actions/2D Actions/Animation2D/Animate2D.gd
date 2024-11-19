######################################################################################
##
##      File: Animate2D.gd
##    Author: Harris Sinclair
## Last Edit: 2024-11-16
##     Brief: This file defines a Animate Action in 2D for the ChronoActions system
##
######################################################################################
@tool
extends BaseAction

class_name Animate2D

var Start   : int = 0 
var End     : int = 0
var Current : int = 0

var Target    : AnimatedSprite2D = null

# Initialization Function
#
# Target_    : What AnimatedSprite2D inherited object is having it's Animation Frames Changed
# Duration_  : How long it should take to Animate (In Seconds)
# Start_     : Which Frame should Start  
# End_       : Which Frame should it End up at
#
func _init(Target_ : AnimatedSprite2D, Duration_ : float, Animation_ : String, Start_ : int, End_ : int):
    super._init(Duration_, "Animate2D")
    Target    = Target_
    Start     = Start_
    Current   = Start_
    End       = End_

    Target.animation = Animation_

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
        Target.frame = Current

    return AmDone