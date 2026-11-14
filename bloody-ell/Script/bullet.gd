extends Area2D

const SPEED = 800.0

func _physics_process(delta: float) -> void:
	position += Vector2.RIGHT.rotated(rotation) * SPEED * delta


func _on_timer_timeout() -> void:
	queue_free()
