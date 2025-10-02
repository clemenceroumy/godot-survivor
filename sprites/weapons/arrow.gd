extends Area2D

var travelled_distance = 0
const SPEED = 600
var RANGE = 1200

func _physics_process(delta: float) -> void:
	var direction = Vector2.RIGHT.rotated(rotation)
	
	position += direction * delta * SPEED
	travelled_distance += delta * SPEED
	
	if(travelled_distance > RANGE):
		queue_free() #destroy this arrow instance


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if(body.has_method("take_damage")):
		body.take_damage()
