extends Interactable

@export var _pcam: PhantomCamera3D
@export var _pcam_priority_when_peeping := 10
@export var _input_controller: InputController
@export var _input_priority_when_peeping := 10

var _is_peeping := false


func get_action_name() -> StringName:
	if _is_peeping:
		return &"stop peeping"
	return &"peep"


func can_interact(who: Node) -> bool:
	if who is Node3D and owner is Node3D:
		var interactor: Node3D = who
		var peephole: Node3D = owner
		var angle := interactor.basis.z.angle_to(-peephole.basis.z)
		return rad_to_deg(angle) < 60.0

	return false


func interact(_who: Node) -> void:
	_is_peeping = not _is_peeping
	if _is_peeping:
		_peep()
	else:
		_stop_peeping()


func _peep() -> void:
	_pcam.priority = _pcam_priority_when_peeping
	_input_controller.priority = _input_priority_when_peeping


func _stop_peeping() -> void:
	_pcam.priority = 0
	_input_controller.priority = 0
