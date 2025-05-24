extends Node3D

var _emitting_particles_count := 0


func _ready() -> void:
	for particles in get_children().filter(func(c): return c is GPUParticles3D):
		particles.emitting = true
		_emitting_particles_count += 1
		particles.finished.connect(_on_particles_finished)


func _on_particles_finished() -> void:
	_emitting_particles_count -= 1
	if 0 == _emitting_particles_count:
		queue_free()
