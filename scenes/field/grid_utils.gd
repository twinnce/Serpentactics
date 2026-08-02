class_name GridUtils
extends RefCounted

const CELL_SIZE: float = 1.0

static func grid_to_world(grid_pisition: Vector2i) -> Vector3:
	return Vector3(grid_pisition.x * CELL_SIZE, 0.0, grid_pisition.y * CELL_SIZE)

static func is_dark_tile(grid_position: Vector2i) -> bool:
	return (grid_position.x + grid_position.y) % 2 == 0
