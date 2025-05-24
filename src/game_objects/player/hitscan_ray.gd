class_name HitscanRay extends RayCast3D

# TODO: emit hit signal, let controllable handle damage logic
signal hit(object: Node)

@export var hit_range := 1.0

@export_group("Fx")
@export var _wood_impact_scene: PackedScene


func try_hit() -> void:
	if is_colliding():
		hit.emit(get_collider())
		_perform_hit()


func _perform_hit() -> void:
	# spawn hit particles
	var particles: Node3D = _wood_impact_scene.instantiate()
	get_tree().root.add_child(particles)
	var collision_pos := get_collision_point()
	particles.look_at_from_position(collision_pos, collision_pos + get_collision_normal())
