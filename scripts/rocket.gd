extends Area2D

@export var speed = 800

func _ready():
	pass 

func _process(delta):
	pass
	
func _physics_process(delta):
	# global_position.x = global_position.x + speed*delta 
	global_position.x += speed*delta
