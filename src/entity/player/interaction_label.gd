extends Label

@export var _interactor_ray: InteractorRay


func _process(_delta: float) -> void:
	text = _interactor_ray.interaction_name
