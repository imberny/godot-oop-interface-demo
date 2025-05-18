class_name DoorLock extends AnimatableBody3D

signal unlocked
signal locked

@export var _is_locked: bool
@export var _door: Door
@export var _anim_tree: AnimationTree

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
