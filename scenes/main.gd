extends Node2D

@onready var pressure_plate: PressurePlate = $PressurePlate
@onready var door: Door = $Door

@onready var camera: Camera2D = $Player/Camera2D
@onready var top_left: Marker2D = $"Top-Left"
@onready var bottom_right: Marker2D = $"Bottom-Right"

func _ready() -> void:
	pressure_plate.activable_component.activated.connect(door.open)
	pressure_plate.activable_component.deactivated.connect(door.close)
	
	
	camera.limit_left = top_left.position.x
	camera.limit_top = top_left.position.y
	camera.limit_right = bottom_right.position.x 
	camera.limit_bottom =bottom_right.position.y
