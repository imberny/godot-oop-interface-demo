@tool
class_name Door extends AnimatableBody3D

@export var starts_open: bool:
	set = _set_starts_open
@export var starts_locked: bool:
	set = _set_starts_locked

var _is_open := false
var _is_locked := false

@onready var _anim_tree: AnimationTree = $AnimationTree
@onready var _playback: AnimationNodeStateMachinePlayback = _anim_tree["parameters/playback"]


func is_locked() -> bool:
	return _is_locked


func is_open() -> bool:
	return _is_open


func knock() -> void:
	_playback.travel("knock")


func lock() -> void:
	_is_locked = true


func unlock() -> void:
	_is_locked = false


func open() -> bool:
	if _is_open:
		return true

	if _is_locked:
		_playback.travel("open locked")
		return false

	_is_open = true
	_playback.travel("open")
	return true


func close() -> void:
	if not _is_open:
		return

	_is_open = false
	_playback.travel("close")


func _set_starts_open(value: bool) -> void:
	starts_open = value
	_is_open = value
	# bypass open locked animation while in editor
	if _is_open:
		_playback.travel("open")
	else:
		_playback.travel("close")


func _set_starts_locked(value: bool) -> void:
	starts_locked = value
	_is_locked = value
