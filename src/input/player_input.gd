@tool
extends InputController

@export var target: Node

var _controllable: Controllable
var _turn_amount := Vector2.ZERO


func _ready() -> void:
	if Engine.is_editor_hint():
		Util.disable(self)

	if not target.is_node_ready():
		await target.ready
	_controllable = Controllable.try_get(target)


func _get_configuration_warnings() -> PackedStringArray:
	var warnings := []
	if not target:
		warnings.push_back("Requires a target node")
	else:
		if not target.get_children().any(func(c): return c is Controllable):
			warnings.push_back("Target node must have a child node that implements Controllable.")
	return warnings


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		event = event as InputEventMouseMotion
		_turn_amount = event.relative * Settings.mouse_sensitivity


func _physics_process(delta: float) -> void:
	_process_turn(delta)
	_process_move(delta)
	_process_actions()


func _process_turn(delta: float) -> void:
	_controllable.turn(_turn_amount, delta)
	_turn_amount = Vector2.ZERO


func _process_move(delta: float) -> void:
	var motion_2d := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var motion := Vector3(motion_2d.x, 0.0, motion_2d.y)
	_controllable.move(motion, delta)


func _process_actions() -> void:
	if Input.is_action_just_pressed("interact"):
		_controllable.do(&"interact")
