extends Area2D

const MOVE_SPEED = 150.0
const WIDTH = 240
const HEIGHT = 320

var shot_scene = preload("res://bullet.tscn")
var can_shot = true

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var input_dir = Vector2()
    if Input.is_key_pressed(KEY_UP):
        input_dir.y -= 1.0
    if Input.is_key_pressed(KEY_DOWN):
        input_dir.y += 1.0
    if Input.is_key_pressed(KEY_LEFT):
        input_dir.x -= 1.0
    if Input.is_key_pressed(KEY_RIGHT):
        input_dir.x += 1.0
    position += (delta * MOVE_SPEED) * input_dir
    if position.x < 0.0:
        position.x = 0.0
    elif position.x > WIDTH:
        position.x = WIDTH
    if position.y < 0.0:
        position.y = 0.0
    elif position.y > HEIGHT:
        position.y = HEIGHT
    if Input.is_key_pressed(KEY_SPACE) and can_shot:
        var stage_node = get_parent()
        var shot_instance = shot_scene.instance()
        can_shot = false
        get_node("ReloadTimer").start()

        shot_instance.position = Vector2(position.x, position.y - 24)
        stage_node.add_child(shot_instance)



func _on_ReloadTimer_timeout():
    can_shot = true
