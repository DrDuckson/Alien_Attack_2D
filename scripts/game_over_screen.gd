extends Control

func _on_btn_restart_pressed():
	get_tree().reload_current_scene()

func set_score(new_score):
	$Panel/lblScore.text = "SCORE: " + str(new_score) 
