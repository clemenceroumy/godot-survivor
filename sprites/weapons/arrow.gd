extends Area2D

var travelled_distance = 0
const SPEED = 500
const RANGE = 1200

func _physics_process(delta: float) -> void:
	var mouse_position = get_viewport().get_mouse_position()
	var direction = Vector2.RIGHT.rotated(mouse_position.angle())
	
	look_at(direction) #rotate sprite to look toward mouse
	position += direction * delta * SPEED
	travelled_distance = delta * SPEED
	
	if(travelled_distance > RANGE):
		queue_free() #destroy this arrow instance
