extends Openable

@export var _anim_tree: AnimationTree

var _state := State.CLOSED
var _is_locked := false

@onready var _playback: AnimationNodeStateMachinePlayback = _anim_tree["parameters/playback"]


func get_state() -> State:
	return _state


func open() -> void:
	if State.OPEN == _state:
		return

	if _is_locked:
		_playback.travel("open locked")
		return

	_state = State.OPEN
	_playback.travel("open")


func close() -> void:
	if State.CLOSED == _state:
		return

	_state = State.CLOSED
	_playback.travel("close")


func lock() -> void:
	_is_locked = true


func unlock() -> void:
	_is_locked = false


func _input(event: InputEvent) -> void:
	if event.is_pressed() and event is InputEventKey:
		if event.keycode == KEY_O:
			open()
		elif event.keycode == KEY_C:
			close()
