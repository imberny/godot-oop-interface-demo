class_name Util


static func disable(node: Node) -> void:
	_set_node_enabled(node, false)


static func enable(node: Node) -> void:
	_set_node_enabled(node, true)


static func _set_node_enabled(node: Node, is_enabled: bool) -> void:
	node.set_process(is_enabled)
	node.set_physics_process(is_enabled)
	node.set_process_input(is_enabled)
	node.set_process_unhandled_input(is_enabled)
