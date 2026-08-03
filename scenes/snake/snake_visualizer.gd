class_name SnakeVisualizer
extends Node3D

const SEGMENT_SCENE := preload("res://scenes/snake/snake_segment.tscn")

var segments: Array[SnakeSegment] = []

func build(snake: Snake) -> void:
	for grid_position in snake.body:
		var segment := SEGMENT_SCENE.instantiate() as SnakeSegment
		add_child(segment)
		segments.append(segment)
		
	_sync(snake)
	snake.moved.connect(_sync.bind(snake))

func _sync(snake: Snake) -> void:
	for i in snake.body.size():
		segments[i].setup(snake.body[i])
