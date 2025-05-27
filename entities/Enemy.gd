extends CharacterBody2D


@onready var health_stat = $Health
@onready var ai = $AI
@onready var weapon = $Weapon


func _ready() -> void:
	ai.initialize(self, weapon)


func handle_hit() -> void:
	health_stat.health -= 10
	if health_stat.health <= 0:
		queue_free()
	print("Enemy hit! ", health_stat.health)
