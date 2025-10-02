extends CharacterBody2D

@onready var soldier = get_node('/root/Game/Soldier')

func _physics_process(delta: float):
	var direction = global_position.direction_to(soldier.global_position)
	velocity = direction * 200
	#move_and_slide()
	
	if(velocity == Vector2.ZERO):
		$AnimatedSprite2D.play("default")
	else:
		$AnimatedSprite2D.play("walk")
		if(direction.x < 0):
			$AnimatedSprite2D.flip_h = true
		elif(direction.x > 0) :
			$AnimatedSprite2D.flip_h = false
