extends ParallaxBackground

func _ready():
	pass

#func _process(delta):
#	scroll_base_offset -= Vector2(0.5,0)

func _physics_process(delta):
	scroll_base_offset -= Vector2(0.5,0)
