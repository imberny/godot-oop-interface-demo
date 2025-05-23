class_name Health extends Node

@export var _health_max := 100

@onready var _health := _health_max


func hurt(amount: int) -> void:
	_health -= amount
	_health = max(_health, 0)
	if 0 == _health:
		get_parent().queue_free()


func heal(amount: int) -> void:
	_health += amount
	_health = min(_health, _health_max)
