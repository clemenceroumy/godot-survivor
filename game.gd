extends Node2D

var crosshair = load("res://assets/sprites/crosshair.png")

func _process(delta: float) -> void:
	Input.set_custom_mouse_cursor(crosshair)

func spawn_orc():
	%PathFollow2D.progress_ratio = randf()
	var new_orc = preload("res://sprites/characters/orc.tscn").instantiate()
	new_orc.global_position = %PathFollow2D.global_position
	add_child(new_orc)

func _on_timer_timeout() -> void:
	spawn_orc()
