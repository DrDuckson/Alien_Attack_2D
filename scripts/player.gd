extends CharacterBody2D

var iSpeed = 300
var iForce = 300
var rocket_scene = preload("res://scenes/rocket.tscn")

func _ready():
	rocket_scene
	
func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot_rocket()

func _physics_process(delta):
	#velocity = Vector2(0,0)
	if Input.is_action_pressed("move_up"):
		velocity.y = -iSpeed
	if Input.is_action_pressed("move_down"):
		velocity.y = iSpeed
	if Input.is_action_pressed("move_left"):
		velocity.x = -iSpeed
	if Input.is_action_pressed("move_right"):
		velocity.x = iSpeed
		
	
	if Input.is_action_just_released("move_up"):
		pass
		velocity.y = -iSpeed*0.2
	if Input.is_action_just_released("move_down"):
		pass
		velocity.y = iSpeed*0.2
	if Input.is_action_just_released("move_left"):
		pass
		velocity.x = -iSpeed*0.2
	if Input.is_action_just_released("move_right"):
		pass
		velocity.x = iSpeed*0.2
		
	move_and_slide()	
	
	print(global_position)
	var screen_size = get_viewport_rect().size
	# Begrenzung 1
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
	#var rocket_scene = preload("res://scenes/rocket.tscn")
	var rocket_instance = rocket_scene.instantiate()
	add_child(rocket_instance)
	rocket_instance.global_position.x += 50
