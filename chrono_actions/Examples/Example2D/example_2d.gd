extends Node2D

@onready var object2D = $"2D_Object"
@onready var animated2D = $"2D_Animation"

func _ready() -> void:

	pass

func _process(_delta: float) -> void:
	if Input.is_key_pressed(KEY_J):
		$ChronoList.AddAction(Animate2D.new(animated2D,1,"Wally_Walk2",0,6))
	pass
