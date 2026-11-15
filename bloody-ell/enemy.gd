extends CharacterBody2D

var speed = 50

var stun = false
var hp = randi_range(1, 4) #enemy's hp, i set it to random from 1-4 rangea
func _physics_process(delta):
	if Global.player != null and stun == false:
		velocity = global_position.direction_to(Global.player.global_position)
	elif stun:
		velocity = lerp(velocity, Vector2(0,0), 0.3)
		
	global_position += velocity *speed * delta
	

	move_and_slide()
	
	if hp <= 0: #enemy dying system
		queue_free()

func _on_hitbox_area_entered(area: Area2D) -> void: #enemy hit
	if area.is_in_group("enemy_damager"):
		
		modulate = Color.DARK_RED
		velocity = -velocity * 4 
		hp -= 1
		stun = true
		$stun_timer.start()
		area.get_parent().queue_free()


func _on_stun_timer_timeout():
	modulate = Color.ALICE_BLUE
	stun = false
