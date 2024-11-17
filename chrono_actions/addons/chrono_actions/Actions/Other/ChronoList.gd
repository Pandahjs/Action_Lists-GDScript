## The Brain of the ChronoActions System, This Executes the Actions.
##      File: ChronoList.gd
##    Author: Harris Sinclair
## Last Edit: 2024-11-17
##     Brief: This file defines the behavior of the ChronoList Node

@tool
extends Node

class_name ChronoList

var ChronoActions : Array[BaseAction] = []

func _enter_tree() -> void:
    pass

func AddAction(act : BaseAction):
    ChronoActions.append(act)

func _process(delta: float) -> void:
    for action in ChronoActions:
        if action.Act(delta) == true:
            ChronoActions.erase(action)

func _exit_tree() -> void:
    pass