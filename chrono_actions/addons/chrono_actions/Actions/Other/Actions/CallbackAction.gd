#****************************************************************************************
#
#      File: CallbackAction.gd
#    Author: Harris Sinclair
#     Brief: This file defines a Callback Action for the ChronoActions system.
#            The Callback Action invokes the effect of a Callable after a Duration
#
#****************************************************************************************
@tool
extends BaseAction

class_name CallbackAction

# The Function to Be Invoked at the end of Duration
var Function : Callable
# The Arguments to be Passed to the Function
var Arguments : Array

# Initialization Function
#
# Duration_  : How long the Wait should last (In Seconds)
# Function_  : Which function should be invoked after the Duration Expires
# Arguments_ : What Arguments to pass to the Function after Duration Expires
#
func _init(Duration_ : float, Function_ : Callable, Arguments_ : Array):
    super._init(Duration_, "Callback")
    Function = Function_
    Arguments = Arguments_

# Act Function
#
# Overrides the Base Action Act Function. Invokes the Base Action Function
# in order to progress along itself through time.
#
# TimeStep : How much time since this action was called last.
#
func Act(TimeStep : float) -> bool:
    var AmDone = super.Act(TimeStep)

    if AmDone:
        Function.call(Arguments)

    return AmDone