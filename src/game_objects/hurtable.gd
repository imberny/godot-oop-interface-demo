extends Hurtable

@export var _health: Health


func hurt(damage: int) -> void:
	_health.hurt(damage)
