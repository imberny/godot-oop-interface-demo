class_name Controllable extends Interface

#region boilerplate

const INTERFACE_NAME := &"Controllable"


static func try_get(from: Node) -> Controllable:
	return try_get_interface(INTERFACE_NAME, from)


func _get_interface_name() -> StringName:
	return INTERFACE_NAME


#enregion boilerplate


func move(_motion: Vector3, delta: float) -> void:
	assert(false, "METHOD NOT IMPLEMENTED")


func turn(_rotation: Vector2, delta: float) -> void:
	assert(false, "METHOD NOT IMPLEMENTED")


func do(_action: StringName) -> void:
	assert(false, "METHOD NOT IMPLEMENTED")
