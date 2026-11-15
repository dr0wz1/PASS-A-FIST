extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 100.0

func _process(delta: float) -> void:
	
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	
	if velocity.y < 0:
		$AnimatedSprite2D.play("running")
	elif direction != Vector2.ZERO:
		$AnimatedSprite2D.play("running")
	else:
		$AnimatedSprite2D.play("idle")
		
		



	velocity = direction * SPEED
	move_and_slide()
