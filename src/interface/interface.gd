## Abstract base class for all interfaces.
class_name Interface extends Node


## interface_name must correspond to the class name of the Interface-derived class.
## Sadly, derived classes need to add some boilerplate as there is no way to get the
## script or the class name from a static method.
static func try_get_interface(interface_name: String, from: Node) -> Interface:
	if from and from.has_meta(interface_name):
		return from.get_meta(interface_name)
	return null


func _ready() -> void:
	var interface_name: String = get_interface_name()
	get_parent().set_meta(interface_name, self)


func _exit_tree() -> void:
	var interface_name: String = get_interface_name()
	get_parent().remove_meta(interface_name)


func get_interface_name() -> String:
	assert(false, "METHOD NOT IMPLEMENTED")
	return ""
