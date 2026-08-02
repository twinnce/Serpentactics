extends Node

func _ready() -> void:
	#_test_fire_damage()
	#_test_self_collision()
	#_test_blocked_by_spikes()
	
	var field := FieldGenerator.generate_rectangle(5, 5)
	var snake := Snake.new(Vector2i(2, 2))
	
	var controller := GameplayController.new(snake, field)
	add_child(controller)
	
	# Временный вывод состояния каждую секунду, чтобы видеть результат ввода
	var timer := Timer.new()
	timer.wait_time = 0.5
	timer.autostart = true
	timer.timeout.connect(func(): print("Голова: ", snake.get_head_position(), " | Здоровье: ", snake.health))
	add_child(timer)

func _test_fire_damage() -> void:
	print("--- Тест: урон от огня ---")
	var field := FieldGenerator.generate_rectangle(5, 5)
	var snake := Snake.new(Vector2i(2, 2))

	var fire_modifier: CellModifier = load("res://resources/cell_modifiers/instances/fire.tres")
	field.get_cell(Vector2i(3, 2)).modifier = fire_modifier

	print("Здоровье до: ", snake.health)
	var direction := Vector2i(1, 0)
	if MovementResolver.can_move(snake, field, direction):
		MovementResolver.apply_move(snake, field, direction)
	print("Голова после: ", snake.get_head_position())
	print("Здоровье после: ", snake.health)

func _test_self_collision() -> void:
	print("--- Тест: столкновение с собой ---")
	var field := FieldGenerator.generate_rectangle(5, 5)
	var snake := Snake.new(Vector2i(2, 2))

	# Вручную задаём тело змеи из 3 клеток, минуя обычное движение,
	# специально в форме буквы "Г", чтобы голова могла упереться
	# в средний сегмент своего же тела.
	snake.body = [Vector2i(2, 2), Vector2i(3, 2), Vector2i(3, 3)]

	var direction := Vector2i(1, 0) # из головы (2,2) в (3,2) — это body[1], средний сегмент
	var result := MovementResolver.can_move(snake, field, direction)
	print("Можно ли войти в себя (ожидаем false): ", result)

func _test_blocked_by_spikes() -> void:
	print("--- Тест: непроходимые шипы ---")
	var field := FieldGenerator.generate_rectangle(5, 5)
	var snake := Snake.new(Vector2i(2, 2))

	var spikes_modifier: CellModifier = load("res://resources/cell_modifiers/instances/burning_spikes.tres")
	field.get_cell(Vector2i(3, 2)).modifier = spikes_modifier

	var direction := Vector2i(1, 0)
	var result := MovementResolver.can_move(snake, field, direction)
	print("Можно ли пройти сквозь шипы (ожидаем false): ", result)
