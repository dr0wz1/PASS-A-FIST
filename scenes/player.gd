extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 100.0

func _process(delta: float) -> void:
	
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	
	if direction.x > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("running")
	elif velocity.y > 0:
		$AnimatedSprite2D.play("running")
	elif direction.x < 0:
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("running")
	elif velocity.y < 0:
		$AnimatedSprite2D.play("running")
	elif direction.x == 0:
		$AnimatedSprite2D.play("idle")



	velocity = direction * SPEED
	move_and_slide()
