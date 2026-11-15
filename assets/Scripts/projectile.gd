extends Area2D

@export var speed: float = 400.0
var direction: Vector2 = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
		

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		queue_free()
	elif body.is_in_group("shield"):
		direction = -direction
		rotation = direction.angle()
	elif not body.is_in_group("enemy"):
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
