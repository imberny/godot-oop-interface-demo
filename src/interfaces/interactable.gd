class_name Interactable extends Interface

#region boilerplate

const INTERFACE_NAME := &"Interactable"


static func try_get(from: Node) -> Interactable:
	return try_get_interface(INTERFACE_NAME, from)


func _get_interface_name() -> StringName:
	return INTERFACE_NAME


#endregion boilerplate


func get_action_name() -> StringName:
	assert(false, "METHOD NOT IMPLEMENTED")
	return &""


func can_interact(_who: Node) -> bool:
	assert(false, "METHOD NOT IMPLEMENTED")
	return false


func interact(_who: Node) -> void:
	assert(false, "METHOD NOT IMPLEMENTED")
