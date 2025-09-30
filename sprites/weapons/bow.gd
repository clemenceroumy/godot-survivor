extends Marker2D
	
func shoot(): 
	const arrow = preload("res://sprites/weapons/arrow.tscn")
	var new_arrow = arrow.instantiate()
	#new_arrow.global_position = self.global_position
	self.add_child(new_arrow)
	
func _on_timer_timeout() -> void:
	shoot()
