extends Interactable

var _key_lock: KeyLock


func _ready() -> void:
	_key_lock = get_parent()
	if not _key_lock:
		push_error("This Interactable implementation must be a child of a KeyLock")


func get_action_name() -> StringName:
	if _key_lock.is_locked():
		return "UNLOCK"
	return "LOCK"


func can_interact(_who: Node) -> bool:
	# check for correct key
	return true


func interact(_who: Node) -> void:
	if _key_lock.is_locked():
		_key_lock.unlock()
	else:
		_key_lock.lock()
