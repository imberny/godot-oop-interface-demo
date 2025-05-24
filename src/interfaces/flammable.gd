class_name Flammable extends Interface

#region boilerplate

const INTERFACE_NAME := &"Flammable"


static func try_get(from: Node) -> Flammable:
	return try_get_interface(INTERFACE_NAME, from)


func _get_interface_name() -> StringName:
	return INTERFACE_NAME


#endregion boilerplate


func get_intensity() -> int:
	assert(false, "METHOD NOT IMPLEMENTED")
	return 0


func ignite(_amount: int) -> void:
	assert(false, "METHOD NOT IMPLEMENTED")


func douse(_amount: int) -> void:
	assert(false, "METHOD NOT IMPLEMENTED")
