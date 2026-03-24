extends CharacterBody2D


@export var speed = 400
@export var bullet_scene: PackedScene
@onready var bullet_spawner: Marker2D = $"Bullet Spawner"

var last_input = Vector2.ZERO

var input_stack: Array[Vector2] = []
var look_stack: Array[Vector2] = []

enum Direction {UP, DOWN, LEFT, RIGHT}

var last_look_direction = Vector2.DOWN

var active_bullet = null


var move_actions = {
	"move_left": Vector2.LEFT,
	"move_right": Vector2.RIGHT,
	"move_up": Vector2.UP,
	"move_down": Vector2.DOWN
}

var look_actions = {
	"look_left": Vector2.LEFT,
	"look_right": Vector2.RIGHT,
	"look_up": Vector2.UP,
	"look_down": Vector2.DOWN
}


func add_input(stack: Array[Vector2], dir: Vector2):
	if dir not in stack:
		stack.append(dir)

func remove_input(stack: Array[Vector2], dir: Vector2):
	stack.erase(dir)
	
	
func update_stack(stack: Array[Vector2], actions: Dictionary):
	for action in actions:
		if Input.is_action_just_pressed(action):
			add_input(stack, actions[action])
		if Input.is_action_just_released(action):
			remove_input(stack, actions[action])
	

func get_input():
	update_stack(input_stack, move_actions)
	update_stack(look_stack, look_actions)
	
	#var input = Vector2.ZERO
	#
	#if input_stack.size() > 0:
		#input = input_stack[-1]  # last pressed
	#velocity = input * speed
	
	var final_dir = Vector2.ZERO
	for dir in input_stack:
		final_dir += dir

	velocity = final_dir.normalized() * speed
	
	
func update_look():
	if look_stack.size() > 0:
		last_look_direction = look_stack[-1]
	
	bullet_spawner.position = last_look_direction * 64
	
	
func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = bullet_spawner.global_position
	bullet.direction = last_look_direction
	bullet.connect("teleport_requested", _on_bullet_teleport)
	get_tree().current_scene.add_child(bullet)
	active_bullet = bullet

func teleport():
	active_bullet.request_teleport()
	
func _on_bullet_teleport(position: Vector2):
	global_position = position
	active_bullet = null

func _physics_process(delta):
	get_input()
	update_look()
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot"):
		if active_bullet != null:
			teleport()
		else:
			shoot()
