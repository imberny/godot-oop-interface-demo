extends Controllable

@export var _body: CharacterBody3D
@export var _head: Node3D
@export var _interactor_ray: InteractorRay

@export_group("Movement")
@export var speed_max := 5.0
@export var acceleration := 8.0
@export var deceleration := 12.0

var _velocity: Vector3


func turn(turn_amount: Vector2, delta: float) -> void:
	_body.rotation.y -= turn_amount.x
	_head.rotation.x -= turn_amount.y
	_head.rotation.x = clampf(_head.rotation.x, -PI + 0.2, PI - 0.2)


func move(motion: Vector3, delta: float) -> void:
	var local_motion := _body.basis * motion
	var desired_velocity := local_motion * speed_max
	# https://www.rorydriscoll.com/2016/03/07/frame-rate-independent-damping-using-lerp/
	_velocity = _velocity.lerp(desired_velocity, 1.0 - exp(-acceleration * delta))
	_body.velocity = _velocity
	_body.move_and_slide()


func do(action: StringName) -> void:
	match action:
		&"interact":
			_try_interact()


func _try_interact() -> void:
	if _interactor_ray.can_interact():
		_interactor_ray.interact()
