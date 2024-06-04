extends Node2D

signal enemy_spawned(enemy_instance)
signal path_enemy_signal(path_enemy_instance)

var spawnJ = preload("res://scenes/uncut_enemy_j.tscn")
var spawnK = preload("res://scenes/uncut_enemy_k.tscn")
var spawnM = preload("res://scenes/uncut_enemy_m.tscn")
var enemy1 = preload("res://scenes/enemy_1.tscn")
var battery = preload("res://scenes/battery.tscn")
var pathenemy = preload("res://scenes/path_enemy.tscn")
var enemy_instance
@onready var spawn_positions = $Spawnpositions

var rng = RandomNumberGenerator.new()

func _on_timer_timeout():
	spawn_enemy()

func spawn_enemy():
	enemyPicker()
	battery_Spawn()
	#pathEnemy_Spawn()
	if enemy_instance:
		spawnPicker()
		emit_signal("enemy_spawned", enemy_instance)

func enemyPicker():
	var pickEnemy = rng.randi_range(1, 3) #4
	match pickEnemy:
		1: enemy_instance = spawnJ.instantiate()
		2: enemy_instance = spawnK.instantiate()
		3: enemy_instance = spawnM.instantiate()

func battery_Spawn():
	var batterySpawn = rng.randi_range(1, 100)
	if (batterySpawn >= 98):
		enemy_instance = battery.instantiate()

func pathEnemy_Spawn():
	var path_enemy_instance = pathenemy.instantiate()
	emit_signal("path_enemy_signal", path_enemy_instance)

func spawnPicker():
	var spawn_positions_array = spawn_positions.get_children()
	var random_spawn_positions = spawn_positions_array.pick_random()
	enemy_instance.global_position = random_spawn_positions.global_position

func _on_timer_2_timeout():
	pathEnemy_Spawn()
