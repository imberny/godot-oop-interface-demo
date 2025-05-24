extends Hurtable

@export var _health: Health


func hurt(attack: AttackPackage) -> void:
	_health.hurt(attack.damage)
	var flammable := Flammable.try_get(get_parent())
	if flammable:
		flammable.ignite(attack.fire_damage)
