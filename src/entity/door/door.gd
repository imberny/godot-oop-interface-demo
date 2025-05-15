class_name Door extends AnimatableBody3D

@onready var _openable: Openable = $Openable


func lock() -> void:
	_openable.lock()


func unlock() -> void:
	_openable.unlock()
