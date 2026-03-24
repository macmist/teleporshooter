extends Node2D

class_name Door

@onready var collider = $StaticBody2D/CollisionShape2D
@onready var sprite = $Sprite2D



var is_open = false

func _ready():
	close()

func open():
	is_open = true
	collider.set_deferred("disabled", true)
	sprite.modulate = Color(0, 1, 0)

func close():
	is_open = false
	collider.set_deferred("disabled", false)
	
	sprite.modulate = Color(1, 0, 0)
