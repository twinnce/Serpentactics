class_name Snake
extends RefCounted

signal moved

var body: Array[Vector2i] = []
var health: int = 3

func _init(starting_position: Vector2i) -> void:
	body.append(starting_position)

func get_head_position() -> Vector2i:
	return body[0]

func get_tail_position() -> Vector2i:
	return body[-1]

func is_occupying(position: Vector2i) -> bool:
	return body.has(position)

func take_damage(amount: int) -> void:
	health -= amount
