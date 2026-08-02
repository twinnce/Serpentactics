class_name MovementResolver
extends RefCounted

static func can_move(snake: Snake, field: Field, direction: Vector2i) -> bool:
	var target_position := snake.get_head_position() + direction
	if not field.has_cell(target_position):
		return false
	
	if snake.is_occupying(target_position):
		return false
	
	var target_cell := field.get_cell(target_position)
	if target_cell.modifier and target_cell.modifier.has_component(BlocksPassageComponent):
		return false
	
	return true

static func apply_move(snake: Snake, field: Field, direction: Vector2i) -> void:
	var target_position := snake.get_head_position() + direction
	var target_cell := field.get_cell(target_position)
	
	if target_cell.modifier:
		var damage_component := target_cell.modifier.get_component(DamageOnEnterComponent) as DamageOnEnterComponent
		if damage_component:
			snake.take_damage(damage_component.damage)
	
	snake.body.insert(0, target_position)
	snake.body.pop_back()
