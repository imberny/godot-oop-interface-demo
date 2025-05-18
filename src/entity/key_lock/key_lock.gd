class_name KeyLock extends AnimatableBody3D

signal unlocked
signal locked

@export var _door_lock: DoorLock
@export var _is_locked: bool
@export var _anim_tree: AnimationTree

@onready var _playback: AnimationNodeStateMachinePlayback = _anim_tree["parameters/playback"]


func _ready() -> void:
	if _is_locked:
		lock()
	else:
		unlock()
	_door_lock.unlocked.connect(_on_door_lock_unlocked)
	_door_lock.locked.connect(_on_door_lock_locked)


func is_locked() -> bool:
	return _is_locked


func unlock() -> void:
	if not _is_locked:
		return

	_is_locked = false
	_playback.travel("unlock")
	unlocked.emit()
	_door_lock.unlock()


func lock() -> void:
	if _is_locked:
		return

	_is_locked = true
	_playback.travel("lock")
	locked.emit()
	_door_lock.lock()


func _on_door_lock_unlocked() -> void:
	unlock()


func _on_door_lock_locked() -> void:
	lock()
