class_name InputManager extends Node

var _input_controllers: Array[InputController] = []


func _ready() -> void:
	get_tree().node_added.connect(_on_tree_node_added)


func _on_tree_node_added(node: Node) -> void:
	if node is InputController:
		_input_controllers.push_back(node)


func _process(_delta: float) -> void:
	if _input_controllers.is_empty():
		return
	_input_controllers.sort_custom(func(a, b): return a.priority > b.priority)
	var main_input_controller := _input_controllers[0]
	Util.enable(main_input_controller)
	for i in range(1, len(_input_controllers)):
		Util.disable(_input_controllers[i])
