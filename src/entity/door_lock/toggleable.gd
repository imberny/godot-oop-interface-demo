extends Toggleable

signal locked
signal unlocked

enum State { LOCKED, UNLOCKED }

@export var _anim_tree: AnimationTree

var _state := State.UNLOCKED

@onready var _playback: AnimationNodeStateMachinePlayback = _anim_tree["parameters/playback"]


func toggle() -> void:
	match _state:
		State.LOCKED:
			_unlock()
		State.UNLOCKED:
			_lock()


func _unlock() -> void:
	_state = State.UNLOCKED
	_playback.travel("unlock")
	unlocked.emit()


func _lock() -> void:
	_state = State.LOCKED
	_playback.travel("lock")
	locked.emit()


func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_pressed() and event.keycode == KEY_L:
			toggle()
