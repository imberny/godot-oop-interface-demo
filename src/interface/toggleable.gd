class_name Toggleable extends Interface

#region boilerplate

const INTERFACE_NAME := &"Toggleable"


static func try_get(from: Node) -> Toggleable:
	return try_get_interface(INTERFACE_NAME, from)


func get_interface_name() -> StringName:
	return INTERFACE_NAME


#endregion boilerplate


func set_toggled(is_toggled: bool) -> void:
	assert(false, "METHOD NOT IMPLEMENTED")


func toggle() -> void:
	assert(false, "METHOD NOT IMPLEMENTED")
