extends AnimatedSprite2D

@export var _interactor_ray: InteractorRay


func _ready() -> void:
	_interactor_ray.interacted.connect(_on_interactor_ray_interacted)


func _process(_delta: float) -> void:
	visible = _interactor_ray.can_interact()


func _on_interactor_ray_interacted() -> void:
	play("hit")
