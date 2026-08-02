class_name FieldGenerator
extends RefCounted

static func generate_rectangle(width: int, height: int) -> Field:
	var field := Field.new()
	for x in width:
		for y in height:
			var cell := Cell.new(Vector2i(x, y))
			field.set_cell(cell)
	return field
