@tool
extends EditorPlugin

func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	add_custom_type("Chrono List","Node",\
	preload("res://addons/chrono_actions/Actions/Other/RelatedScripts/ChronoList.gd"),\
	preload("res://addons/chrono_actions/Assets/ChronoList_Node_Icon.png"))


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	remove_custom_type("Chrono List")
	pass
