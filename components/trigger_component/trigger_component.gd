extends Area2D

class_name TriggerComponent

@export var trigger_groups: Array[String] = []
@export var bodies_needed: int = 1
signal triggered
signal untriggered

var bodies_inside: Array = []


func _on_body_entered(body):
	print('body entered')
	for group in trigger_groups:
		if body.is_in_group(group):
			bodies_inside.append(body)
			if bodies_inside.size() == bodies_needed:
				emit_signal("triggered")

func _on_body_exited(body):
	for group in trigger_groups:
		if body.is_in_group(group):
			bodies_inside.erase(body)
			if bodies_inside.size() < bodies_needed:
				emit_signal("untriggered")
