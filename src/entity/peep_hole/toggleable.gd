extends Toggleable

@export var _pcam: PhantomCamera3D
@export var _pcam_priority_when_toggled := 10
@export var _input_controller: InputController
@export var _input_priority_when_toggled := 10

var _is_toggled := false


func set_toggled(is_toggled) -> void:
	_is_toggled = is_toggled


func toggle() -> void:
	_is_toggled = not _is_toggled
	if _is_toggled:
		_peep()
	else:
		_stop_peep()


func _peep() -> void:
	_pcam.priority = _pcam_priority_when_toggled
	_input_controller.priority = _input_priority_when_toggled


func _stop_peep() -> void:
	_pcam.priority = 0
	_input_controller.priority = 0
