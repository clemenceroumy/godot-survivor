extends CharacterBody2D

var last_direction_flip = false

func _walk_animation():
	%WalkingAnimatedSprite2D.play()
	%WalkingAnimatedSprite2D.show()
	%IdleAnimatedSprite2D.hide()

func _idle_animation():
	%IdleAnimatedSprite2D.play()
	%IdleAnimatedSprite2D.show()
	%WalkingAnimatedSprite2D.hide()

func _physics_process(delta: float):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	velocity = direction * 400
	move_and_slide()
	
	if(velocity == Vector2.ZERO):
		_idle_animation()
		%IdleAnimatedSprite2D.flip_h = last_direction_flip
	else:
		_walk_animation()
		if(direction.x < 0):
			%WalkingAnimatedSprite2D.flip_h = true
			last_direction_flip = true
		elif(direction.x > 0) :
			%WalkingAnimatedSprite2D.flip_h = false
			last_direction_flip = false
