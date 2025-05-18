class_name InteractorRay extends RayCast3D

signal interacted

@export var _inventory: Inventory


func can_interact() -> bool:
	if not is_colliding():
		return false
	var target := get_collider()

	return Interactable.try_get(target) or Openable.try_get(target)


func interact() -> void:
	assert(is_colliding())
	var target := get_collider()

	if _try_interact(target):
		interacted.emit()


func _try_interact(target) -> bool:
	var interactable := Interactable.try_get(target)
	if interactable and interactable.can_interact(owner):
		interactable.interact(owner)
		return true

	var openable := Openable.try_get(target)
	if openable:
		if openable.is_open():
			openable.close()
		else:
			openable.open()
		return true

	return false
