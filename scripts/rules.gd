extends Control

@onready var rules = $pnlRules

func _ready():
	pass
	
func _on_btn_start_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
