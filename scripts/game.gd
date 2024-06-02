extends Node2D

var lives = 3
var score = 0
var game_over_scene = preload("res://scenes/game_over_screen.tscn")
var rules_scene = preload("res://scenes/rules.tscn")
var rules
@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI

func _ready():
	hud.set_score_label(score)
	hud.set_lives(lives)
	
func _physics_process(delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://scenes/rules.tscn")

func _process(delta):
	pass
	
func _on_deathzone_area_entered(area):
	area.die()
	_on_player_took_damage()

func _on_player_took_damage():
	lives -= 1
	score -= 200
	hud.set_score_label(score)
	hud.set_lives(lives)
	if (lives == 0):
		player.die()
		await get_tree().create_timer(1).timeout
		var gos = game_over_scene.instantiate()
		gos.set_score(score)
		ui.add_child(gos)

func _on_player_took_battery():
	if (lives < 3):
		lives += 1
		hud.set_lives(lives)

func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", _on_enemy_died)
	enemy_instance.connect("hit", _on_battery_hit)
	add_child(enemy_instance)

func _on_battery_hit():
	score += 200
	hud.set_score_label(score)

func _on_enemy_died():
	score += 100
	hud.set_score_label(score)

func _on_player_rocked_missed(rocket_instance):
	rocket_instance.connect("missed_shot", _on_missed_shot)
	
func _on_missed_shot():	
	score -= 50
	hud.set_score_label(score)
