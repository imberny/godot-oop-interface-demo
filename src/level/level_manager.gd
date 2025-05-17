extends Node

@export var initial_level_scene: PackedScene

var _level: Level


func _ready() -> void:
	_load_level(initial_level_scene)


func _load_level(level_scene: PackedScene) -> void:
	if _level:
		_level.queue_free()

	_level = level_scene.instantiate()
	if not _level:
		push_error("Level scene must have a root node of type 'Level'")
		return

	_level.completed.connect(_on_level_completed)
	add_child(_level)


func _on_level_completed(next_level_scene: PackedScene) -> void:
	_load_level(next_level_scene)
