## The Brain of the ChronoActions System, This Executes the Actions.
##      File: ChronoList.gd
##    Author: Harris Sinclair
## Last Edit: 2024-11-17
##     Brief: This file defines the behavior of the ChronoList Node

@tool
extends Node

class_name ChronoList

var ChronoActions : Array[BaseAction] = []
var BlockedGroups : Dictionary = {}

func _enter_tree() -> void:
    pass

func AddAction(act : BaseAction):
    ChronoActions.append(act)

func _process(delta: float) -> void:
    BlockedGroups.clear()
    for action in ChronoActions:
        # Run the Action Forward
        var result = action.Act(delta)

        #if it's done, delete it
        if result == true:
            ChronoActions.erase(action)
        else:
            # Add it's blocked groups to the list (if any)
            for group in action.Groups.keys:
                BlockedGroups[group].assign(action.Groups[group])

func _exit_tree() -> void:
    pass