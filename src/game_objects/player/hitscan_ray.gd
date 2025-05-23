class_name HitscanRay extends RayCast3D

@export var damage := 10
@export var range := 1.0


func hit() -> void:
	if is_colliding():
		_perform_hit()


func _perform_hit() -> void:
	var collider := get_collider()
	var hurtable := Hurtable.try_get(collider)
	if hurtable:
		hurtable.hurt(damage)
		return

	# spawn hit particles
