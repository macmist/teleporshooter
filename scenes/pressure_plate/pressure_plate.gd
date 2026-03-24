extends Node2D

class_name PressurePlate

@onready var trigger_component: TriggerComponent = $TriggerComponent
@onready var activable_component: ActivableComponent = $ActivableComponent

func _ready() -> void:
	trigger_component.connect("triggered", activable_component.activate)
	trigger_component.connect("untriggered", activable_component.deactivate)
