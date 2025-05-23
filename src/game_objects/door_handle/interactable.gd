extends Interactable

@onready var _door_handle: DoorHandle = get_parent()


func get_action_name() -> StringName:
	if _door_handle.door.is_open():
		return &"close"
	return &"turn handle"


func can_interact(_who: Node) -> bool:
	return true


func interact(_who: Node) -> void:
	_door_handle.turn()
