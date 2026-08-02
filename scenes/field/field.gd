class_name Field
extends RefCounted

var cells: Dictionary[Vector2i, Cell] = {}

## Возвращает клетку по позиции
func get_cell(position: Vector2i) -> Cell:
	return cells.get(position, null)

## Проверяет существует ли клетка по позиции, возвращает bool
func has_cell(position: Vector2i) -> bool:
	return cells.has(position)

## Устанавливает новую клетку на место старой
func set_cell(cell: Cell) -> void:
	cells[cell.grid_position] = cell

## Полностью удаляет клетку
func remove_cell(position: Vector2i) -> void:
	cells.erase(position)
