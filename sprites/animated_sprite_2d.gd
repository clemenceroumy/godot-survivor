extends CharacterBody2D

@onready var _idle_animated_sprite = $IdleAnimatedSprite2D
@onready var _walking_animated_sprite = $WalkingAnimatedSprite2D

func _walk_animation():
	_walking_animated_sprite.play()
	_walking_animated_sprite.show()
	_idle_animated_sprite.hide()

func _idle_animation():
	_idle_animated_sprite.play()
	_idle_animated_sprite.show()
	_walking_animated_sprite.hide()

func _physics_process(delta: float):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	if(velocity == Vector2.ZERO):
		_idle_animation()
	else:
		_walk_animation()
