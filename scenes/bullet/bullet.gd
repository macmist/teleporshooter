extends Area2D

signal teleport_requested(position: Vector2)

@export var speed = 600
@export var direction = Vector2.ZERO

func _init() -> void:
	add_to_group("bullet")

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	

func request_teleport():
	emit_signal("teleport_requested", global_position)
	queue_free()
