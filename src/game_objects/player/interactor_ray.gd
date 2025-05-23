class_name InteractorRay extends RayCast3D

signal interacted

@export var _inventory: Inventory

var interaction_name: StringName


func _process(_delta: float) -> void:
	if can_interact():
		interaction_name = Interactable.try_get(get_collider()).get_action_name()
	else:
		interaction_name = &""


func can_interact() -> bool:
	if not is_colliding():
		return false
	var target := get_collider()

	var interactable := Interactable.try_get(target)
	if not interactable:
		return false
	return interactable.can_interact(owner)


func interact() -> void:
	assert(is_colliding())
	var target := get_collider()

	var interactable := Interactable.try_get(target)
	interactable.interact(owner)
	interacted.emit()
