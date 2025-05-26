extends Interactable

@export var _slot_marker: Node3D
@export var _shape_cast: ShapeCast3D


func get_action_name() -> StringName:
	return &"PLACE"


func can_interact(who: Node) -> bool:
	if _is_space_occupied():
		return false

	var gearable := Gearable.try_get(who)
	if gearable:
		return gearable.has_primary()

	return false


func interact(who: Node) -> void:
	var gearable := Gearable.try_get(who)
	if gearable:
		var weapon := gearable.unequip_primary()
		if weapon is Node3D:
			weapon.global_position = _slot_marker.global_position
			weapon.global_rotation = _slot_marker.global_rotation


func _is_space_occupied() -> bool:
	return _shape_cast.is_colliding()
