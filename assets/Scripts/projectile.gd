extends Area2D

@export var speed: float = 400.0
var direction: Vector2 = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	# Menggerakkan peluru terus-menerus ke arah yang ditentukan
	position += direction * speed * delta

# Hubungkan sinyal body_entered dari Area2D ke fungsi ini
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		# Panggil fungsi pengurang darah pemain jika ada (contoh: body.take_damage(10))
		print("Pemain terkena tembakan!")
		queue_free() # Hancurkan peluru
	elif not body.is_in_group("enemy"):
		# Hancurkan peluru jika menabrak tembok
		queue_free()

# Hubungkan sinyal screen_exited dari VisibleOnScreenNotifier2D ke fungsi ini
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
