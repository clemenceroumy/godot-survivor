extends CharacterBody2D

@onready var soldier = get_node('/root/Game/Soldier')

var is_walking: bool = true

func _physics_process(delta: float):	
	if(is_walking):
		var direction = global_position.direction_to(soldier.global_position)
		velocity = direction * 200
		move_and_slide()
		
		if(velocity == Vector2.ZERO):
			$AnimatedSprite2D.play("default")
		else:
			$AnimatedSprite2D.play("walk")
			if(direction.x < 0):
				$AnimatedSprite2D.flip_h = true
			elif(direction.x > 0) :
				$AnimatedSprite2D.flip_h = false

func take_damage() -> void:
	$HealthBar.value -= 1
	is_walking = false
	
	if($HealthBar.value == 0):
		$AnimatedSprite2D.play("die")
		await $AnimatedSprite2D.animation_finished
		queue_free()
	else: 
		$AnimatedSprite2D.play('hurt')
		await $AnimatedSprite2D.animation_finished
		is_walking = true
