extends Gearable

@export var _inventory: Inventory


func has_primary() -> bool:
	return null != _inventory.primary


func get_primary() -> Node:
	return _inventory.primary


func equip_primary(weapon: Node) -> void:
	_inventory.equip_primary(weapon)


func unequip_primary() -> Node:
	return _inventory.unequip_primary()
