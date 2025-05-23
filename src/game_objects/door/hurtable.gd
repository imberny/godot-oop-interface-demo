extends Hurtable


func hurt(_damage: int) -> void:
	get_parent().queue_free()
