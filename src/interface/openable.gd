class_name Openable extends Interface

#region boilerplate

const INTERFACE_NAME := &"Openable"


static func try_get(from: Node) -> Openable:
	return try_get_interface(INTERFACE_NAME, from)


func get_interface_name() -> StringName:
	return INTERFACE_NAME


#endregion boilerplate


func is_open() -> bool:
	assert(false, "METHOD NOT IMPLEMENTED")
	return false


func open() -> void:
	assert(false, "METHOD NOT IMPLEMENTED")


func close() -> void:
	assert(false, "METHOD NOT IMPLEMENTED")


func lock() -> void:
	assert(false, "METHOD NOT IMPLEMENTED")


func unlock() -> void:
	assert(false, "METHOD NOT IMPLEMENTED")
