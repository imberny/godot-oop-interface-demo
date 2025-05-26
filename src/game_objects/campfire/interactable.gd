extends Interactable


func get_action_name() -> StringName:
	return &"IGNITE"


func can_interact(who: Node) -> bool:
	var gearable := Gearable.try_get(who)
	if not gearable:
		return false

	var primary := gearable.get_primary()
	var flammable := Flammable.try_get(primary)
	return null != flammable


func interact(who: Node) -> void:
	var gearable := Gearable.try_get(who)
	var flammable := Flammable.try_get(gearable.get_primary())
	flammable.ignite(100)
