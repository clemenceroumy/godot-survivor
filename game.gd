extends Node2D

var crosshair = load("res://assets/sprites/crosshair.png")

func _process(delta: float) -> void:
	Input.set_custom_mouse_cursor(crosshair)
