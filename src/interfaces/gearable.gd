## A game object which can be equipped with other objects.
class_name Gearable extends Interface

#region boilerplate

const INTERFACE_NAME := &"Gearable"


static func try_get(from: Node) -> Gearable:
	return try_get_interface(INTERFACE_NAME, from)


func get_interface_name() -> StringName:
	return INTERFACE_NAME


#endregion boilerplate


func has_primary() -> bool:
	assert(false, "METHOD NOT IMPLEMENTED")
	return false


func equip_primary(_weapon: Node) -> void:
	assert(false, "METHOD NOT IMPLEMENTED")


func unequip_primary() -> Node:
	assert(false, "METHOD NOT IMPLEMENTED")
	return null
