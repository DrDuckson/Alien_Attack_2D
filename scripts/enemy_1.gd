extends Area2D

signal died
#var rng = RandomNumberGenerator.new()
#@onready var speed = rng.randf_range(150, 350)
@export var speed = 200

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	global_position.x -= speed*delta

func die():
	emit_signal("died")
	queue_free()
	
func _on_body_entered(body):
	body.take_damage()
	die()
