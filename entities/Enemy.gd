extends CharacterBody2D


@onready var health_stat = $Health


func handle_hit() -> void:
	health_stat.health -= 10
	if health_stat.health <= 0:
		queue_free()
	print("Enemy hit! ", health_stat.health)
