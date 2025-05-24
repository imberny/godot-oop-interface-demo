extends Wieldable

@export var _damage := 1

var _collision_shapes: Array[CollisionShape3D]

@onready var body: RigidBody3D = get_parent()


func _ready() -> void:
	for collision_shape in body.get_children().filter(func(c): return c is CollisionShape3D):
		_collision_shapes.push_back(collision_shape)


func wield() -> void:
	_set_physics(false)


func drop() -> void:
	_set_physics(true)


func get_damage() -> int:
	return _damage


func _set_physics(is_enabled: bool) -> void:
	body.freeze = not is_enabled
	for collision_shape in _collision_shapes:
		collision_shape.disabled = not is_enabled
