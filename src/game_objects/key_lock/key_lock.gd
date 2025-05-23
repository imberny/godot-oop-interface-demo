@tool
class_name KeyLock extends AnimatableBody3D

signal unlocked
signal locked

@export var starts_locked: bool:
	set = _set_starts_locked
@export var _door_lock: DoorLock

var _is_locked: bool

@onready var _anim_tree: AnimationTree = $AnimationTree
@onready var _playback: AnimationNodeStateMachinePlayback = _anim_tree["parameters/playback"]


func _ready() -> void:
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


func _set_starts_locked(value: bool) -> void:
	starts_locked = value
	if _door_lock:
		_door_lock.starts_locked = value
	if starts_locked:
		lock()
	else:
		unlock()


func _on_door_lock_unlocked() -> void:
	unlock()


func _on_door_lock_locked() -> void:
	lock()


func _get_configuration_warnings() -> PackedStringArray:
	var warnings := []
	if not _door_lock:
		push_error("KeyLock requires a matching DoorLock object")
	return warnings
