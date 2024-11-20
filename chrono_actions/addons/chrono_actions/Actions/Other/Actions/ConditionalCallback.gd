#****************************************************************************************
#
#      File: ConditionalCallback.gd
#    Author: Harris Sinclair
#     Brief: This file defines a Conditional Callback Action for the ChronoActions system.
#            The Callback Action invokes the effect of a Callable after a Duration
#            IF the Conditional Function returns True
#
#****************************************************************************************
@tool
extends BaseAction

class_name ConditionalCallback

# The Function to Be Invoked at the end of Duration
var Function : Callable
# The Arguments to be Passed to the Function
var Arguments : Array

# The Conditional Function that is checked at the end of the Duration
# The Function should be in the form:
# func NAME(Arguments)->bool:
var ConditionalFunction : Callable

# Arguments to be passed to the Conditional Function
var ConditionalArguments : Array

# Initialization Function
#
# Duration_  : How long the Wait should last (In Seconds)
# Function_  : Which function should be invoked after the Duration Expires
# Arguments_ : What Arguments to pass to the Function after Duration Expires
# ConditionalFunction_ : What Conditional Function to Check to In Order to Invoke Function
# ConditionalFunctionArguments_ : Arguments to pass to the Conditional Function
#
func _init(Duration_ : float, Function_ : Callable, Arguments_ : Array, ConditionalFunction_ : Callable, ConditionalFunctionArguments_ : Array):
    super._init(Duration_, "ConditionalCallback")
    Function = Function_
    Arguments = Arguments_
    ConditionalFunction = ConditionalFunction_
    ConditionalArguments = ConditionalFunctionArguments_

# Act Function
#
# Overrides the Base Action Act Function. Invokes the Base Action Function
# in order to progress along itself through time.
#
# TimeStep : How much time since this action was called last.
#
func Act(TimeStep : float) -> bool:
    var AmDone = super.Act(TimeStep)

    if ConditionalFunction.call(ConditionalArguments) == true:
        Function.call(Arguments)

    return AmDone