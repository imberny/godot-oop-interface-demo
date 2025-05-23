class_name InteractorRay extends RayCast3D

signal interacted

@export var _inventory: Inventory
@export var _weapon_slot: AttachmentSlot

var interaction_name: StringName


func _process(_delta: float) -> void:
	interaction_name = _get_interaction_name()


func _get_interaction_name() -> StringName:
	if can_interact():
		var interactable := Interactable.try_get(get_collider())
		if interactable:
			return interactable.get_action_name()
		var wieldable := Wieldable.try_get(get_collider())
		if wieldable:
			return &"wield"
	return &""


func can_interact() -> bool:
	if not is_colliding():
		return false
	var target := get_collider()

	var interactable := Interactable.try_get(target)
	if interactable:
		return interactable.can_interact(owner)

	var wieldable := Wieldable.try_get(target)
	if wieldable:
		return true

	return false


func interact() -> void:
	assert(is_colliding())
	var target := get_collider()

	var interactable := Interactable.try_get(target)
	if interactable:
		interactable.interact(owner)
		interacted.emit()
		return

	var wieldable := Wieldable.try_get(target)
	if wieldable:
		_weapon_slot.attach(target)
		wieldable.wield()
		return
