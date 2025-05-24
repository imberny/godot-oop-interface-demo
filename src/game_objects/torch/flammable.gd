extends Flammable

@export var _fire_scene: PackedScene
@export var _flame_position: Node3D
@export var _intensity_max := 100
@export var _intensity_decay_per_tick := 0
@export var _damage_tick_rate := 1.0

var _intensity := 0
var _fire: Node3D
var _tick_tween: Tween


func _ready() -> void:
	_tick_tween = create_tween().set_loops()
	_tick_tween.tween_interval(_damage_tick_rate)
	_tick_tween.tween_callback(_tick)


func get_intensity() -> int:
	return _intensity


func ignite(amount: int) -> void:
	if 0 == _intensity and 0 < amount:
		_fire = _fire_scene.instantiate()
		_flame_position.add_child(_fire)
	_intensity += amount
	_intensity = min(_intensity, _intensity_max)


func douse(amount: int) -> void:
	_intensity -= amount
	_intensity = max(_intensity, 0)
	if 0 == _intensity:
		_fire.queue_free()
		_fire = null


func _tick() -> void:
	var hurtable := Hurtable.try_get(get_parent())
	if hurtable:
		hurtable.hurt(AttackPackage.new().with_damage(_intensity))
	_intensity -= _intensity_decay_per_tick
