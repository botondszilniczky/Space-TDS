extends CharacterBody2D
class_name Player


signal player_fired(bullet, position, direction)


@export var speed: int = 100


@onready var health_stat = $Health
@onready var weapon = $Weapon


func _ready() -> void:
	weapon.connect("weapon_fired", self.shoot)


func _physics_process(_delta: float) -> void:
	var move_direction := Vector2.ZERO
	
	if Input.is_action_pressed("up"):
		move_direction.y = -1
	if Input.is_action_pressed("down"):
		move_direction.y = 1
	if Input.is_action_pressed("left"):
		move_direction.x = -1
	if Input.is_action_pressed("right"):
		move_direction.x = 1
	
	move_direction = move_direction.normalized()
	velocity = move_direction * speed
	move_and_slide()
	
	look_at(get_global_mouse_position())


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("shoot"):
		weapon.shoot()


func shoot(bullet_instance: Bullet, location: Vector2, direction: Vector2) -> void:
	emit_signal("player_fired", bullet_instance, location, direction)


func handle_hit() -> void:
	health_stat.health -= 10
	print("Player hit! ", health_stat.health)
