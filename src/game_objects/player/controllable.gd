extends Controllable

@export var _body: CharacterBody3D
@export var _head: Node3D
@export var _interactor_ray: InteractorRay

@export_group("Movement")
@export var _speed_max := 5.0
@export var _acceleration := 8.0
@export var _deceleration := 12.0
@export var _jump_speed := 5.0

@export_group("Combat")
@export var _inventory: Inventory
@export var _primary_weapon: WeaponSlot

var _velocity: Vector3


func turn(turn_amount: Vector2, _delta: float) -> void:
	_body.rotation.y -= turn_amount.x
	_head.rotation.x -= turn_amount.y
	_head.rotation.x = clampf(_head.rotation.x, -PI + 0.2, PI - 0.2)


func move(motion: Vector3, delta: float) -> void:
	var gravity: Vector3 = (
		ProjectSettings.get_setting("physics/3d/default_gravity")
		* ProjectSettings.get_setting("physics/3d/default_gravity_vector")
	)

	var local_motion := _body.basis * motion
	var desired_velocity_xz := local_motion * _speed_max
	var velocity_xz := Vector3(_velocity.x, 0.0, _velocity.z)
	var velocity_y := Vector3(0.0, _velocity.y, 0.0) + gravity * delta
	# https://www.rorydriscoll.com/2016/03/07/frame-rate-independent-damping-using-lerp/
	velocity_xz = velocity_xz.lerp(desired_velocity_xz, 1.0 - exp(-_acceleration * delta))
	_velocity = velocity_xz + velocity_y
	_body.velocity = _velocity
	_body.move_and_slide()
	_velocity = _body.velocity


func do(action: StringName) -> void:
	match action:
		&"interact":
			_try_interacting()
		&"attack":
			_try_attacking()
		&"jump":
			_try_jumping()


func _try_interacting() -> void:
	if _interactor_ray.can_interact():
		_interactor_ray.interact()


func _try_attacking() -> void:
	if _inventory.has_primary():
		_primary_weapon.swing()


func _try_jumping() -> void:
	if _body.is_on_floor():
		_velocity.y = _jump_speed
