extends CharacterBody2D
const SPEED = 300.0 #kecepatan karakter

var shooting = preload("res://bullet.tscn") #buat nyambungin ke kodingan bullet
@onready var muzzle = $Muzzle

func _physics_process(_delta: float) -> void:
	look_at(get_global_mouse_position()) #buat ngarahin ke mouse

	#this is for the character to move around, kalo mau diubah ke project>settings>input map
	velocity.x = Input.get_axis("left", "right") * SPEED 
	velocity.y = Input.get_axis("up", "down") * SPEED
	velocity = lerp(get_real_velocity(), velocity, 0.2)
	
	if Input.is_action_just_pressed("shoot"):
		var bullet = shooting.instantiate()
		bullet.global_position = muzzle.global_position
		bullet.rotation = (get_global_mouse_position() - muzzle.global_position).angle()
		get_tree().current_scene.add_child(bullet)
	#terakhir menit 10-11 video
	
	
	move_and_slide()
