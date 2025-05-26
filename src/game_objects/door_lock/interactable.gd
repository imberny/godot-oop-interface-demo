extends Interactable

var _door_lock: DoorLock


func _ready() -> void:
	_door_lock = get_parent()
	if not _door_lock:
		push_error("This interactable implementation must be a child of a DoorLock")
		return


func get_action_name() -> StringName:
	if _door_lock.is_locked():
		return "UNLOCK"
	return "LOCK"


func can_interact(_who: Node) -> bool:
	return true


func interact(_who: Node) -> void:
	if _door_lock.is_locked():
		_door_lock.unlock()
	else:
		_door_lock.lock()
