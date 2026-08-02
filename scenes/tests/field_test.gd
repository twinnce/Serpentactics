extends Node

func _ready() -> void:
	var field := FieldGenerator.generate_rectangle(5, 5)
	print("Клеток создано: ", field.cells.size())
	print("Клетка (2, 3) существует: ", field.has_cell(Vector2i(2, 3)))
	print("Клетка (10, 10) существует: ", field.has_cell(Vector2i(10, 10)))	
