extends Node2D


func handle_bullet_spawned(bullet: Bullet, location: Vector2, direction: Vector2) -> void:
	add_child(bullet)
	bullet.global_position = location
	bullet.set_direction(direction)
