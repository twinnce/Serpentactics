extends Node

const RENDER_RIG_SCENE := preload("res://scenes/common/pixel_render_rig.tscn")

func _ready() -> void:
	var field := FieldGenerator.generate_rectangle(5, 5)
	var snake := Snake.new(Vector2i(2, 2))
	
	snake.body = [
		Vector2i(2, 2),
		Vector2i(2, 1),
		Vector2i(2, 0),
		Vector2i(1, 0),
		Vector2i(0, 0),
		Vector2i(0, 1)
	]
	
	var render_rig := RENDER_RIG_SCENE.instantiate()
	add_child(render_rig)
	
	var world_content := render_rig.find_child("WorldContent") as Node3D
	
	var field_visualizer := FieldVisualizer.new()
	world_content.add_child(field_visualizer)
	field_visualizer.build(field)
	
	var snake_visualizer := SnakeVisualizer.new()
	world_content.add_child(snake_visualizer)
	snake_visualizer.build(snake)
	
	var controller := GameplayController.new(snake, field)
	add_child(controller)
