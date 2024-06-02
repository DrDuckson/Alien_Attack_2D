extends Area2D

signal missed_shot
@export var speed = 1000
@onready var visible_notifier = $VisibleNotifier

func _ready():
	visible_notifier.connect("screen_exited", _on_screen_exited)

func _on_screen_exited():
	queue_free()
	emit_signal("missed_shot")

func _on_area_entered(area):
	queue_free()
	area.die()

func _process(delta):
	pass
	
func _physics_process(delta):
	global_position.x += speed*delta


