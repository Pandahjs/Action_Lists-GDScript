extends Node2D


func _ready() -> void:
    $ChronoList.AddAction(Move2D.new($"2D_Object",5,$"2D_Object".position,$"2D_Object".position+Vector2(300,0),true))
    $ChronoList.AddAction(Rotate2D.new($"2D_Object",5,$"2D_Object".rotation_degrees,$"2D_Object".rotation_degrees+45,true))
    pass

func _process(_delta: float) -> void:
    pass