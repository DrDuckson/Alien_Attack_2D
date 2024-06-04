extends CharacterBody2D

signal took_damage
signal took_battery
signal rocked_missed(rocket_instance)

var iSpeed = 300
var iForce = 300
var rocket_scene = preload("res://scenes/rocket.tscn")
var rocket_instance

@onready var rocket_container = $RocketContainer 
@onready var shooting_rocket = $shooting

func _ready():
	rocket_container = get_node("RocketContainer")
	
func _process(delta):
	pass

func take_damage():
	emit_signal("took_damage")
	
func heal():
	emit_signal("took_battery")
	
func die():
	queue_free()
	
func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot_rocket()
		shooting_rocket.play()
	
	if Input.is_action_pressed("move_up"):
		velocity.y = -iSpeed
	if Input.is_action_pressed("move_down"):
		velocity.y = iSpeed
	if Input.is_action_pressed("move_left"):
		velocity.x = -iSpeed
	if Input.is_action_pressed("move_right"):
		velocity.x = iSpeed
	
	if Input.is_action_just_released("move_up"):
		velocity.y = -iSpeed*0.1
	if Input.is_action_just_released("move_down"):
		velocity.y = iSpeed*0.1
	if Input.is_action_just_released("move_left"):
		velocity.x = -iSpeed*0.1
	if Input.is_action_just_released("move_right"):
		velocity.x = iSpeed*0.1
		
	move_and_slide()	
	
	var screen_size = get_viewport_rect().size
	#Begrenzung 1
	#if global_position.x < 0:
		#global_position.x = 0
	#if global_position.x > screen_size.x:
		#global_position.x = screen_size.x
	#if global_position.y < 0:
		#global_position.y = 0;
	#if global_position.y > screen_size.y:
		#global_position.y = screen_size.y
	
	# Begrenzung 2
	#global_position.x = clampf(global_position.x, 0, screen_size.x)
	#global_position.y = clampf(global_position.y, 0, screen_size.y)
	
	# Begrenzung 3 = beste performance
	global_position = global_position.clamp(Vector2(0,0), screen_size)
	
func shoot_rocket():
	rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 50
	missed()

func missed():
	emit_signal("rocked_missed", rocket_instance)
