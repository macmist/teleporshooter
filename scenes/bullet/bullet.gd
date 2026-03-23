extends Area2D


@export var speed = 600
@export var direction = Vector2.ZERO

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
