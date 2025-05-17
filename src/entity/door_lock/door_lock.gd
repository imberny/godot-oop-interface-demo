class_name DoorLock extends AnimatableBody3D

signal unlocked
signal locked

@export var _door: Door


func set_locked(is_locked: bool) -> void:
	Toggleable.try_get(self).set_toggled(is_locked)


func unlock() -> void:
	Toggleable.try_get(self).toggle()


func lock() -> void:
	Toggleable.try_get(self).toggle()


func _on_toggleable_locked() -> void:
	locked.emit()
	_door.lock()


func _on_toggleable_unlocked() -> void:
	unlocked.emit()
	_door.unlock()
