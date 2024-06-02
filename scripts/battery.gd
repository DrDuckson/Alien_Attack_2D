extends Area2D

signal hit
var speed = 200

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	global_position.x -= speed*delta
	
func die():
	queue_free()
	emit_signal("hit")
	
func _on_body_entered(body):
	body.heal()
	queue_free()
