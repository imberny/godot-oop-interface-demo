class_name Inventory extends Node

@export var _items: Array[StringName] = []

@export_group("Weaponry")
@export var _hitscan_ray: HitscanRay
@export var _primary_slot: AttachmentSlot

var primary: Node


func has(id: StringName) -> bool:
	return _items.has(id)


func add(id: StringName) -> void:
	_items.push_back(id)


func remove(id: StringName) -> bool:
	if not has(id):
		return false
	_items.erase(id)
	return true


func has_primary() -> bool:
	return null != primary


func equip_primary(weapon: Node) -> void:
	if primary:
		unequip_primary()
	primary = weapon
	if weapon is Node3D:
		_primary_slot.attach(weapon)
	var wieldable := Wieldable.try_get(weapon)
	if wieldable:
		wieldable.wield()
		_hitscan_ray.damage = wieldable.get_damage()


func unequip_primary() -> Node:
	var weapon := primary
	primary = null
	_primary_slot.detach()
	var wieldable := Wieldable.try_get(weapon)
	if wieldable:
		wieldable.drop()
		_hitscan_ray.damage = 0
	return weapon
