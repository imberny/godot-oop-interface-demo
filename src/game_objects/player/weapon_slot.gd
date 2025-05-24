class_name WeaponSlot extends AttachmentSlot

@export var anim_player: AnimationPlayer
@export var hitscan_ray: HitscanRay


func swing() -> void:
	if anim_player.is_playing():
		return

	var anim: StringName = [&"axe_swing_1", &"axe_swing_2", &"axe_swing_3"].pick_random()
	anim_player.play(anim)


func hit() -> void:
	hitscan_ray.try_hit()
