extends Area2D
class_name Bullet


@onready var despawn_timer = $DespawnTimer


@export var speed: int = 5


var direction := Vector2.ZERO


func _ready() -> void:
	# despawn_timer.start()
	pass


func _physics_process(_delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		
		global_position += velocity


func set_direction(new_direction: Vector2) -> void:
	self.direction = new_direction


func _on_despawn_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("handle_hit"):
		body.handle_hit()
		queue_free()
