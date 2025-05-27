extends Node2D


@onready var bullet_handler = $BulletHandler
@onready var player: Player = $Player


func _ready() -> void:
	GlobalSignals.connect("bullet_fired", bullet_handler.handle_bullet_spawned)
