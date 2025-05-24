class_name Hurtable extends Interface

#region boilerplate

const INTERFACE_NAME := &"Hurtable"


static func try_get(from: Node) -> Hurtable:
	return try_get_interface(INTERFACE_NAME, from)


func _get_interface_name() -> StringName:
	return INTERFACE_NAME


#endregion boilerplate


func hurt(_attack: AttackPackage) -> void:
	assert(false, "METHOD NOT IMPLEMENTED")
