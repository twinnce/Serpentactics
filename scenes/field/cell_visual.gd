class_name CellVisual
extends MeshInstance3D

const LIGHT_MATERIAL := preload("res://resources/materials/light_tile_material.tres")
const DARK_MATERIAL := preload("res://resources/materials/dark_tile_material.tres")

func setup(grid_position: Vector2i) -> void:
	position = GridUtils.grid_to_world(grid_position)
	material_override = DARK_MATERIAL if GridUtils.is_dark_tile(grid_position) else LIGHT_MATERIAL
