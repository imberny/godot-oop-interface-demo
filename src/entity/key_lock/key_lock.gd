class_name KeyLock extends AnimatableBody3D

@export var door_lock: DoorLock
@export var is_locked: bool


func _ready() -> void:
	Unlockable.try_get(self).set_locked(is_locked)
	door_lock.set_locked(is_locked)
	door_lock.unlocked.connect(_on_door_lock_unlocked)
	door_lock.locked.connect(_on_door_lock_locked)


func unlock() -> void:
	door_lock.unlock()


func lock() -> void:
	door_lock.lock()


func _on_unlockable_unlocked() -> void:
	unlock()


func _on_unlockable_locked() -> void:
	lock()


func _on_door_lock_unlocked() -> void:
	Unlockable.try_get(self).set_locked(false)


func _on_door_lock_locked() -> void:
	Unlockable.try_get(self).set_locked(true)
