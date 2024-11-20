#****************************************************************************************
#
#      File: WaitAction.gd
#    Author: Harris Sinclair
# Last Edit: 2024-11-16
#     Brief: This file defines a Wait Action for the ChronoActions system.
#            The Wait Action causes Actions after this one in the ChronoList to stop
#            executing until this one is finished.
#
#****************************************************************************************
@tool
extends BaseAction

class_name WaitAction

# Initialization Function
#
# Duration_  : How long the Wait should last (In Seconds)
#
func _init(Duration_ : float):
    super._init(Duration_, "Wait")

# Act Function
#
# Overrides the Base Action Act Function. Invokes the Base Action Function
# in order to progress along itself through time.
#
# TimeStep : How much time since this action was called last.
#
func Act(TimeStep : float) -> bool:
    var AmDone = super.Act(TimeStep)

    return AmDone