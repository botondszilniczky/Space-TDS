extends Node2D


signal state_changed(new_state)


enum State {
	PATROL,
	ENGAGE
}


@onready var  detection_zone = $DetectionZone


var player: Player = null
var state: State = State.PATROL:
	set(new_value):
		if state == new_value:
			return
		
		state = new_value
		emit_signal("state_changed", state)

var entity: CharacterBody2D = null
var weapon: Weapon = null


func _process(delta: float) -> void:
	match state:
		State.PATROL:
			pass
		State.ENGAGE:
			if player != null and weapon != null:
				entity.rotation = entity.global_position.direction_to(player.global_position).angle()
				weapon.shoot()
			else:
				push_error("Player or weapon is null but we are in engage state")
		_:
			push_error("In a state that should not exixst")


func initialize(entity: CharacterBody2D, weapon: Weapon):
	self.entity = entity
	self.weapon = weapon


func _on_detection_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("ally"):
		state = State.ENGAGE
		player = body


func _on_detection_zone_body_exited(body: Node2D) -> void:
	if body == player:
		state = State.PATROL
		player = null
