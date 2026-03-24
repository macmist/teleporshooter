extends Node2D

@onready var pressure_plate: PressurePlate = $PressurePlate
@onready var door: Door = $Door

func _ready() -> void:
	pressure_plate.activable_component.activated.connect(door.open)
	pressure_plate.activable_component.deactivated.connect(door.close)
	
