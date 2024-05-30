extends Area2D

@export var speed = 1000
@onready var visible_notifier = $VisibleNotifier

func _ready():
	visible_notifier.connect("screen_exited", _on_screen_exited)

func _on_screen_exited():
	queue_free()

func _process(delta):
	pass
	
func _physics_process(delta):
	# global_position.x = global_position.x + speed*delta 
	global_position.x += speed*delta
