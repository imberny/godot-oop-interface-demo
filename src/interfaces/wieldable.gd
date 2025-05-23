class_name Wieldable extends Interface

#region boilerplate

const INTERFACE_NAME := &"Wieldable"


static func try_get(from: Node) -> Wieldable:
	return try_get_interface(INTERFACE_NAME, from)


func get_interface_name() -> StringName:
	return INTERFACE_NAME


#endregion boilerplate


func wield() -> void:
	assert(false, "METHOD NOT IMPLEMENTED")


func drop() -> void:
	assert(false, "METHOD NOT IMPLEMENTED")
