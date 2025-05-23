class_name Inventory extends Node

@export var _items: Array[StringName] = []


func has(id: StringName) -> bool:
	return _items.has(id)


func add(id: StringName) -> void:
	_items.push_back(id)


func remove(id: StringName) -> bool:
	if not has(id):
		return false
	_items.erase(id)
	return true
