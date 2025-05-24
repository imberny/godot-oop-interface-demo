class_name AttackPackage

var weapon: Node
var damage := 0
var fire_damage := 0


func with_weapon(node: Node) -> AttackPackage:
	weapon = node
	var wieldable := Wieldable.try_get(node)
	if wieldable:
		damage = wieldable.get_damage()
	var flammable := Flammable.try_get(node)
	if flammable:
		fire_damage = flammable.get_intensity()
	return self


func with_damage(amount: int) -> AttackPackage:
	damage = amount
	return self


func with_fire_damage(amount: int) -> AttackPackage:
	fire_damage = amount
	return self
