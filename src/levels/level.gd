class_name Level extends Node3D

signal completed(next_level_scene: PackedScene)


func _ready() -> void:
	TranslationServer.set_locale("es")
