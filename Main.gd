extends Node2D


@onready var bullet_handler = $BulletHandler
@onready var player: Player = $Player


func _ready() -> void:
	player.connect("player_fired", bullet_handler.handle_bullet_spawned)
