extends Area2D

const HEIGHT = 320
const WIDTH =240
var explosion_scene = preload("res://Explosion.tscn")
var move_speed = 100
var score_emitted = false

signal score

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(0.0, move_speed * delta)
	if position.y > WIDTH :
		queue_free()
	

func _on_Asteroid_area_entered(area:Area2D):
	if area.is_in_group("bullet") or area.is_in_group("ship"):
		if not score_emitted:
			score_emitted = true
			emit_signal("score")
			queue_free()
			var stage_node = get_parent()
			var explosion_instance = explosion_scene.instance()
			explosion_instance.position = position
			stage_node.add_child(explosion_instance)
