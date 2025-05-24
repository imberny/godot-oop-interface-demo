extends Interactable

@export var _douse_amount := 100
@export var _anim_player: AnimationPlayer


func get_action_name() -> StringName:
	return &"douse"


func can_interact(who: Node) -> bool:
	var gearable := Gearable.try_get(who)
	if not gearable:
		return false

	var flammable := Flammable.try_get(gearable.get_primary())
	if not flammable:
		return false

	return 0 < flammable.get_intensity()


func interact(who: Node) -> void:
	var burning_weapon := Gearable.try_get(who).get_primary()
	var flammable := Flammable.try_get(burning_weapon)
	flammable.douse(_douse_amount)
	_anim_player.play("douse")
