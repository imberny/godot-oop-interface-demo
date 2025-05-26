extends Interactable

@onready var _door: Door = get_parent()


func get_action_name() -> StringName:
	if _door.is_open():
		return &"CLOSE"
	return &"KNOCK"


func can_interact(who: Node) -> bool:
	if not _door.is_open():
		return _is_in_front_of_door(who)
	return true


func interact(who: Node) -> void:
	if _door.is_open():
		_door.close()
	elif _is_in_front_of_door(who):
		_door.knock()


func _is_in_front_of_door(who: Node3D) -> bool:
	if not who:
		return false
	return PI / 2.0 > who.global_basis.z.angle_to(_door.global_basis.z)
