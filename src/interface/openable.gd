class_name Openable extends Interface

## Boilerplate start
const INTERFACE_NAME := "Openable"


static func try_get(from: Node) -> Openable:
	return try_get_interface(INTERFACE_NAME, from)


func get_interface_name() -> String:
	return INTERFACE_NAME


## Boilerplate end

enum State { OPEN, CLOSED }


func get_state() -> State:
	assert(false, "METHOD NOT IMPLEMENTED")
	return State.CLOSED


func open() -> void:
	assert(false, "METHOD NOT IMPLEMENTED")


func close() -> void:
	assert(false, "METHOD NOT IMPLEMENTED")


func lock() -> void:
	assert(false, "METHOD NOT IMPLEMENTED")


func unlock() -> void:
	assert(false, "METHOD NOT IMPLEMENTED")
