extends Node2D

var spawnJ = preload("res://scenes/uncut_enemy_j.tscn")
var spawnK = preload("res://scenes/uncut_enemy_k.tscn")
var spawnM = preload("res://scenes/uncut_enemy_m.tscn")
var enemy1 = preload("res://scenes/enemy_1.tscn")
var enemy_instance
@onready var spawn_positions = $Spawnpositions

#var rng = RandomNumberGenerator.new()
#@onready var pickEnemy = rng.randi_range(1, 3)

func _on_timer_timeout():
	
	spawn_enemy()

func spawn_enemy():
	#var enemy_instance = spawnJ.instantiate()
	enemyPicker()
	spawnPicker()
	
	add_child(enemy_instance)
	#rocket_container.add_child(rocket_instance)
	#rocket_instance.global_position = global_position
	#rocket_instance.global_position.x += 50

func enemyPicker():
	var pickEnemy = RandomNumberGenerator.new().randi_range(1, 3)
	match pickEnemy:
		1: enemy_instance = spawnJ.instantiate()
		2: enemy_instance = spawnK.instantiate()
		3: enemy_instance = spawnM.instantiate()

func spawnPicker():
	var spawn_positions_array = spawn_positions.get_children()
	var random_spawn_positions = spawn_positions_array.pick_random()
	enemy_instance.global_position = random_spawn_positions.global_position
