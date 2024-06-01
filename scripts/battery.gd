extends Area2D

var speed = 200

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	global_position.x -= speed*delta
	
func die():
	queue_free()
	
func _on_body_entered(body):
	body.heal()
	die()
