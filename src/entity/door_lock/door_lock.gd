@tool
class_name DoorLock extends AnimatableBody3D

signal unlocked
signal locked

@export var starts_locked: bool:
	set = _set_starts_locked
@export var _door: Door

var _is_locked: bool

@onready var _anim_tree: AnimationTree = $AnimationTree
@onready var _playback: AnimationNodeStateMachinePlayback = _anim_tree["parameters/playback"]


func is_locked() -> bool:
	return _is_locked


func unlock() -> void:
	if not _is_locked:
		return

	_is_locked = false
	_playback.travel("unlock")
	unlocked.emit()
	_door.unlock()


func lock() -> void:
	if _is_locked:
		return

	_is_locked = true
	_playback.travel("lock")
	locked.emit()
	_door.lock()


func _set_starts_locked(value: bool) -> void:
	starts_locked = value
	_door.starts_locked = value
	if starts_locked:
		lock()
	else:
		unlock()
