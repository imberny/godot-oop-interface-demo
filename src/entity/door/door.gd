class_name Door extends AnimatableBody3D


func lock() -> void:
	Openable.try_get(self).lock()


func unlock() -> void:
	Openable.try_get(self).unlock()
