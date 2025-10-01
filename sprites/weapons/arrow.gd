extends Area2D

var travelled_distance = 0
const SPEED = 200
var RANGE = 1200

func _physics_process(delta: float) -> void:
	position += Vector2.RIGHT.rotated(rotation) * delta * SPEED
	travelled_distance = delta * SPEED
	
	if(travelled_distance > RANGE):
		queue_free() #destroy this arrow instance
