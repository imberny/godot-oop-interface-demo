extends Openable

@export var _anim_tree: AnimationTree

var _is_open := false
var _is_locked := false

@onready var _playback: AnimationNodeStateMachinePlayback = _anim_tree["parameters/playback"]


func is_open() -> bool:
	return _is_open


func open() -> void:
	if _is_open:
		return

	if _is_locked:
		_playback.travel("open locked")
		return

	_is_open = true
	_playback.travel("open")


func close() -> void:
	if not _is_open:
		return

	_is_open = false
	_playback.travel("close")


func lock() -> void:
	_is_locked = true


func unlock() -> void:
	_is_locked = false
