class_name SnakeSegment
extends MeshInstance3D

const HEIGHT_OFFSET: float = 0.375

func setup(grid_position: Vector2i) -> void:
	var world_position := GridUtils.grid_to_world(grid_position)
	world_position.y = HEIGHT_OFFSET
	position = world_position
