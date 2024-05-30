extends Area2D

@onready var visible_notifier = $Uncut_EnemyK_Visible_Notifier
var rng = RandomNumberGenerator.new()
@onready var speed = rng.randf_range(250, 400)

func _ready():
	visible_notifier.connect("screen_exited", _on_screen_exited)
#func _ready():
	#visible_notifier.connect("screen_exited", _on_screen_exited)

func _on_screen_exited():
	queue_free()

func _process(delta):
	pass

func _physics_process(delta):
	# global_position.x = global_position.x + speed*delta 
	global_position.x -= speed*delta
