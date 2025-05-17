@tool
extends Node2D


func _process(_delta: float) -> void:
	var window_size := DisplayServer.window_get_size()
	position = window_size / 2
