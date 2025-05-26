extends Interactable

@export var _wieldable: Wieldable

var _is_wielded := false

@onready var body: RigidBody3D = get_parent()


func get_action_name() -> StringName:
	if _is_wielded:
		return &"DROP"
	return &"WIELD"


func can_interact(who: Node) -> bool:
	return null != Gearable.try_get(who)


func interact(who: Node) -> void:
	var gearable := Gearable.try_get(who)
	gearable.equip_primary(body)
	_wieldable.wield()
