extends CharacterBody2D


@onready var player = $/root/game/player

const SPEED = 100
func _physics_process(delta: float) -> void:
	velocity = (player.get_globalposition - global_position).normalized() * SPEED
	
	move_and_slide()
