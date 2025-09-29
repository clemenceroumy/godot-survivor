extends CharacterBody2D

func _physics_process(delta: float):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	velocity = direction * 400
	move_and_slide()
	
	if(velocity == Vector2.ZERO):
		%AnimatedSprite2D.play("default")
	else:
		%AnimatedSprite2D.play("walk")
		if(direction.x < 0):
			%AnimatedSprite2D.flip_h = true
		elif(direction.x > 0) :
			%AnimatedSprite2D.flip_h = false
