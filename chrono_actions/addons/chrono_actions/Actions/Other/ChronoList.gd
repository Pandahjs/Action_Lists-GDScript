######################################################################################
## 
##      File: ChronoList.gd
##    Author: Harris Sinclair
##     Brief: This file defines the behavior of the ChronoList Node
##            The Brain of the ChronoActions System, This Executes the Actions.
##
######################################################################################

@tool
extends Node

class_name ChronoList

var ChronoActions : Array[BaseAction] = []
var BlockedGroups : Array[String]     = []

func _enter_tree() -> void:
	pass

func AddAction(act : BaseAction):
	ChronoActions.append(act)

func _process(delta: float) -> void:
	BlockedGroups.clear()

	# For all actions (that we're going to execute)
	for action in ChronoActions:
		# Check if we're in a blocked group
		var isBlocked = false
		for group in BlockedGroups:
			if action.IsInGroup(group):
				isBlocked = true
		
		if !isBlocked:
			# Run the Action Forward
			var result = action.Act(delta)

			#if it's done, delete it
			if result == true:
				ChronoActions.erase(action)
		
			# If we're a Wait Action, just exit
			if action is WaitAction:
				break;

			# We're not done, check the blocking
			if result != true:
				# Add it's blocked groups to the list (if any)
				for group in action.Groups.keys():
					if action.IsBlockingGroup(group):
						BlockedGroups.push_back(group)

func _exit_tree() -> void:
	pass
