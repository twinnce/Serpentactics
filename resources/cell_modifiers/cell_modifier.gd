class_name CellModifier
extends Resource

@export var diasplay_name: String
@export var icon: Texture2D
@export var description: String
@export var components: Array[CellModifierComponent] = []

## Возвращает компонент клетки, если он существует, в противном случае возвращает null
func get_component(component_type: Script) -> CellModifierComponent:
	for component in components:
		if is_instance_of(component, component_type):
			return component
	return null

## Проверяет существует ли компонент клетки, возвращает значение bool
func has_component(component_type: Script) -> bool:
	return get_component(component_type) != null
