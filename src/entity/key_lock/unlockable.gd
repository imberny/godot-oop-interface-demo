extends Unlockable

signal unlocked
signal locked

@export var _key_id: StringName
@export var _anim_tree: AnimationTree

var _is_locked := false

@onready var _playback: AnimationNodeStateMachinePlayback = _anim_tree["parameters/playback"]


func _unlock() -> bool:
	if not _is_locked:
		_playback.travel("fail")
		return false

	_is_locked = false
	_playback.travel("unlock")
	unlocked.emit()
	return true


func _lock() -> bool:
	if _is_locked:
		_playback.travel("fail")
		return false

	_is_locked = true
	_playback.travel("lock")
	locked.emit()
	return true


func get_key_id() -> StringName:
	return _key_id


func is_locked() -> bool:
	return _is_locked


func set_locked(is_locked_: bool) -> void:
	_is_locked = is_locked_


func try_lock(key := &"") -> bool:
	if key == _key_id:
		return _lock()
	_playback.travel("fail")
	return false


func try_unlock(key := &"") -> bool:
	if key == _key_id:
		return _unlock()
	_playback.travel("fail")
	return false
