class_name GameplayController
extends Node

var snake: Snake
var field: Field

func _init(initial_snake: Snake, initial_field: Field) -> void:
	snake = initial_snake
	field = initial_field

func _unhandled_input(event: InputEvent) -> void:
	var direction := _get_direction_from_input()
	if direction == Vector2i.ZERO:
		return
	
	if MovementResolver.can_move(snake, field, direction):
		MovementResolver.apply_move(snake, field, direction)

func _get_direction_from_input() -> Vector2i:
	if Input.is_action_just_pressed("move_north"):
		return Vector2i(0, -1)
	if Input.is_action_just_pressed("move_south"):
		return Vector2i(0, 1)
	if Input.is_action_just_pressed("move_east"):
		return Vector2i(1, 0)
	if Input.is_action_just_pressed("move_west"):
		return Vector2i(-1, 0)
	return Vector2i.ZERO
