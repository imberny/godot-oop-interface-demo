class_name KeyLock extends AnimatableBody3D

@export var _door_lock: DoorLock
@export var is_locked: bool


func _ready() -> void:
	Unlockable.try_get(self).set_locked(is_locked)
	_door_lock.unlocked.connect(_on_door_lock_unlocked)
	_door_lock.locked.connect(_on_door_lock_locked)


func unlock() -> void:
	_door_lock.unlock()


func lock() -> void:
	_door_lock.lock()


func _on_unlockable_unlocked() -> void:
	unlock()


func _on_unlockable_locked() -> void:
	lock()


func _on_door_lock_unlocked() -> void:
	Unlockable.try_get(self).set_locked(false)


func _on_door_lock_locked() -> void:
	Unlockable.try_get(self).set_locked(true)
