class_name Toggleable extends Interface

## Boilerplate start
const INTERFACE_NAME := "Toggleable"


static func try_get(from: Node) -> Toggleable:
	return try_get_interface(INTERFACE_NAME, from)


func get_interface_name() -> String:
	return INTERFACE_NAME


## Boilerplate end


func toggle() -> void:
	assert(false, "METHOD NOT IMPLEMENTED")
