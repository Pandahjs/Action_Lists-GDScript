extends Node3D

@onready var object3D = $"3D_Object"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$ChronoList.AddAction(Scale3D.new(object3D,2,Vector3(1,1,1),Vector3(2,3,0.5)))
	$ChronoList.AddAction(Rotate3D.new(object3D,5,0,PI/2,1, false))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
