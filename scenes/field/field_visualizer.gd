class_name FieldVisualizer
extends Node3D

const CELL_VISUAL_SCENE := preload("res://scenes/field/cell_visual.tscn")

func build(field: Field) -> void:
	for grid_position in field.cells:
		var cell_visual := CELL_VISUAL_SCENE.instantiate() as CellVisual
		cell_visual.setup(grid_position)
		add_child(cell_visual)
