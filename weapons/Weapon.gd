extends Node2D


signal weapon_fired(bullet, position, direction)


@export var Projectile: PackedScene


@onready var bullet_init_position = $BulletInitPosition
@onready var attack_cooldown = $AttackCooldown


func shoot() -> void :
	print("weapon.shoot()")
	if attack_cooldown.is_stopped() and Projectile != null:
		var bullet_instance = Projectile.instantiate()
		var target = get_global_mouse_position()
		var direction_to_mouse = bullet_init_position.global_position.direction_to(target).normalized()
		emit_signal("weapon_fired", bullet_instance, bullet_init_position.global_position, direction_to_mouse)
		attack_cooldown.start()
