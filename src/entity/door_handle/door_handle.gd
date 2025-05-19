class_name DoorHandle extends AnimatableBody3D

@export var door: Door

@onready var _anim_player: AnimationPlayer = $AnimationPlayer


func turn() -> void:
	if door.is_open():
		door.close()
		return

	if door.open():
		_anim_player.play("turn")
	else:
		_anim_player.play("wiggle")
