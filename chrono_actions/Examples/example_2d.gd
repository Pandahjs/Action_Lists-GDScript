extends Node2D

@onready var object2D = $"2D_Object"

func _ready() -> void:
    $ChronoList.AddAction(Move2D.new(object2D,5,object2D.position,object2D.position+Vector2(300,0),true))
    $ChronoList.AddAction(Rotate2D.new(object2D,5,object2D.rotation_degrees,object2D.rotation_degrees+45,true))
    $ChronoList.AddAction(Modulate2D.new(object2D,5,Color.WHITE,Color.DEEP_PINK,true))

    pass

func _process(_delta: float) -> void:
    pass