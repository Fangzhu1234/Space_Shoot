extends Node2D

var is_game_over = false
var astroid = preload("res://Asteroid.tscn")
const WIDTH = 240
const HEIGHT = 320
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Ship").connect("destroyed", self, "_on_ship_destroyed")


func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	if is_game_over and Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene("res://stage.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_ship_destroyed():
	get_node("UI/retry").show()
	is_game_over = true


func _on_SpawnTimer_timeout():
	pass # Replace with function body.
