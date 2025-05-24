@tool
extends Node3D

@export var _starts_locked: bool:
	set(value):
		_starts_locked = value
		if not is_inside_tree():
			await ready
		_key_lock.starts_locked = value

@export var _starts_open: bool:
	set(value):
		_starts_open = value
		if not is_inside_tree():
			await ready
		_door.starts_open = value

@onready var _door: Door = $Door
@onready var _key_lock: KeyLock = $Door/KeyLock


func _ready() -> void:
	if Engine.is_editor_hint():
		return

	_door.tree_exiting.connect(queue_free)
