extends Area2D

class_name Door

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D


var is_open = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func open():
	print('opening')
	is_open = true
	collision.disabled = true
	sprite.modulate = Color(0,1,0)


func close():
	print('closing')
	is_open = false
	collision.disabled = false
	sprite.modulate = Color(1,0,0)
