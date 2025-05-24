class_name Health extends Node

@export var _health_max := 100
@export var _death_scene: PackedScene

@onready var _health := _health_max


func hurt(amount: int) -> void:
	_health -= amount
	_health = max(_health, 0)
	if 0 == _health:
		get_parent().queue_free()
		var death: Node3D = _death_scene.instantiate()
		get_tree().root.add_child(death)
		death.global_transform = get_parent().global_transform


func heal(amount: int) -> void:
	_health += amount
	_health = min(_health, _health_max)
