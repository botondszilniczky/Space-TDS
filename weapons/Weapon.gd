extends Node2D
class_name Weapon


signal weapon_fired(bullet, position, direction)


@export var Projectile: PackedScene


@onready var bullet_init_position = $BulletInitPosition
@onready var bullet_target_position = $BulletTargetPosition
@onready var attack_cooldown = $AttackCooldown


func shoot() -> void :
	print("weapon.shoot()")
	if attack_cooldown.is_stopped() and Projectile != null:
		var bullet_instance = Projectile.instantiate()
		var direction_to_mouse = bullet_init_position.global_position.direction_to(bullet_target_position.global_position).normalized()
		GlobalSignals.emit_signal("bullet_fired", bullet_instance, bullet_init_position.global_position, direction_to_mouse)
		attack_cooldown.start()
