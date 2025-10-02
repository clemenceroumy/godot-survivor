extends Area2D

#AREA2D allow us to detect enemies in its surface. In my case, I don't really need it
		
func shoot(): 
	const arrow = preload("res://sprites/weapons/arrow.tscn")
	var new_arrow = arrow.instantiate()

	new_arrow.global_rotation = %ShootingPoint.global_rotation
	new_arrow.global_transform.origin = %ShootingPoint.global_transform.origin
	
	var game = get_node("/root/Game")
	game.add_child(new_arrow) #attach to root
	
func _on_timer_timeout() -> void:
	shoot()
	
func _input(event):
	if event is InputEventMouseMotion:
		$BoxPivot.look_at(event.position)
