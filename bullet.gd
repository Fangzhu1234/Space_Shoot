extends Area2D

const MOVE_SPEED = 500.0


# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    position += Vector2(0.0, -MOVE_SPEED * delta)
    if position.y <= 0:
        queue_free()