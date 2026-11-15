extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 100.0

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true
		
	
	if direction != Vector2.ZERO:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
	
	velocity = direction * SPEED
	move_and_slide()
