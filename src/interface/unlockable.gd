class_name Unlockable extends Interface

#region boilerplate

const INTERFACE_NAME := &"Unlockable"


static func try_get(from: Node) -> Unlockable:
	return try_get_interface(INTERFACE_NAME, from)


func get_interface_name() -> StringName:
	return INTERFACE_NAME


#endregion boilerplate


func get_key_id() -> StringName:
	assert(false, "METHOD NOT IMPLEMENTED")
	return &""


func is_locked() -> bool:
	assert(false, "METHOD NOT IMPLEMENTED")
	return false


func set_locked(is_locked: bool) -> void:
	assert(false, "METHOD NOT IMPLEMENTED")


func try_lock(_key := &"") -> bool:
	assert(false, "METHOD NOT IMPLEMENTED")
	return false


func try_unlock(_key := &"") -> bool:
	assert(false, "METHOD NOT IMPLEMENTED")
	return false
