class_name InteractorRay extends RayCast3D

signal interacted

@export var _inventory: Inventory


func can_interact() -> bool:
	if not is_colliding():
		return false
	var target := get_collider()

	return Toggleable.try_get(target) or Openable.try_get(target) or Unlockable.try_get(target)


func interact() -> void:
	assert(is_colliding())
	var target := get_collider()

	interacted.emit()

	var toggleable := Toggleable.try_get(target)
	if toggleable:
		toggleable.toggle()
		return

	var openable := Openable.try_get(target)
	if openable:
		if openable.is_open():
			openable.close()
		else:
			openable.open()
		return

	var unlockable := Unlockable.try_get(target)
	if unlockable:
		var required_key_id := unlockable.get_key_id()
		var key := required_key_id if _inventory.has(required_key_id) else &""
		if unlockable.is_locked():
			unlockable.try_unlock(key)
		else:
			unlockable.try_lock(key)
