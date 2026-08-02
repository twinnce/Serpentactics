class_name Cell
extends RefCounted

var grid_position: Vector2i
var modifier: CellModifier = null

func _init(position: Vector2i) -> void:
	grid_position = position
