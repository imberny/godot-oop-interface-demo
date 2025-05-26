extends Label

@export var _interactor_ray: InteractorRay


func _process(_delta: float) -> void:
	text = _capitalize(tr(_interactor_ray.interaction_name))


func _capitalize(string: String) -> String:
	if string.is_empty():
		return string
	var first_char := string.substr(0, 1).capitalize()
	var rest := string.substr(1)
	return "%s%s" % [first_char, rest]
