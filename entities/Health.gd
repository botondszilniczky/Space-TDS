extends Node2D


@export var health: int = 100:
	set(new_value):
		health = clamp(new_value, 0, 100)
