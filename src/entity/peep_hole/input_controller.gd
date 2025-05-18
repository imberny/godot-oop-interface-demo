extends InputController

@export var _interactable: Interactable
@export var _pcam: PhantomCamera3D
@export var _max_y_angle_degrees := 50.0
@export var _max_x_angle_degrees := 30.0

@onready var _initial_rotation_x_degrees := _pcam.rotation_degrees.x
@onready var _initial_rotation_y_degrees := _pcam.rotation_degrees.y


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		_interactable.interact(owner)
	elif event is InputEventMouseMotion:
		event = event as InputEventMouseMotion
		_pcam.rotation.y -= event.relative.x * Settings.mouse_sensitivity
		_pcam.rotation.x -= event.relative.y * Settings.mouse_sensitivity
		_pcam.rotation_degrees.x = clampf(
			_pcam.rotation_degrees.x,
			_initial_rotation_x_degrees - _max_x_angle_degrees,
			_initial_rotation_x_degrees + _max_x_angle_degrees
		)
		_pcam.rotation_degrees.y = clampf(
			_pcam.rotation_degrees.y,
			_initial_rotation_y_degrees - _max_y_angle_degrees,
			_initial_rotation_y_degrees + _max_y_angle_degrees
		)
