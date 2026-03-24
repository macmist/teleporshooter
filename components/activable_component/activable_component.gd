extends Node

class_name ActivableComponent

signal activated
signal deactivated

@export var one_shot := false
@export var toggle_mode := false

var is_active := false

func activate():
	if one_shot and is_active:
		return
	
	if toggle_mode:
		if is_active:
			deactivate()
		else:
			set_active(true)
	else:
		set_active(true)

func deactivate():
	if one_shot:
		return
	
	set_active(false)

func set_active(value: bool):
	if is_active == value:
		return
	
	is_active = value
	
	if is_active:
		emit_signal("activated")
	else:
		emit_signal("deactivated")
