@tool
extends Node3D

@export var _starts_locked: bool:
	set(value):
		_starts_locked = value
		_key_lock.starts_locked = value

@export var _starts_open: bool:
	set(value):
		_starts_open = value
		_door.starts_open = value

@onready var _door: Door = $Door
@onready var _key_lock: KeyLock = $Door/KeyLock
