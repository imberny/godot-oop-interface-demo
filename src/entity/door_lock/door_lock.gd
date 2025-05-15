class_name DoorLock extends AnimatableBody3D

@export var _door: Door


func _on_toggleable_locked() -> void:
	_door.lock()


func _on_toggleable_unlocked() -> void:
	_door.unlock()
