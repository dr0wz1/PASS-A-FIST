extends CharacterBody2D

var speed: float = 70.0
@export var projectile_scene: PackedScene# Slot untuk memasukkan file projectile.tscn

var player: Node2D = null

@onready var muzzle: Marker2D = $Muzzle
@onready var shoot_timer: Timer = $ShootTimer

func _physics_process(delta: float) -> void:
	if player:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
		
	move_and_slide()

func shoot() -> void:
	if projectile_scene and player:
		var bullet = projectile_scene.instantiate()
		bullet.global_position = muzzle.global_position
		bullet.direction = muzzle.global_position.direction_to(player.global_position)
		bullet.rotation = bullet.direction.angle()
		get_tree().current_scene.add_child(bullet)


# Hubungkan sinyal timeout dari ShootTimer ke fungsi ini
func _on_shoot_timer_timeout() -> void:
	shoot()

func _on_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		shoot_timer.start()

func _on_detection_area_body_exited(body: Node2D) -> void:
	if body == player:
		player = null
		shoot_timer.stop() 


func _on_area_2d_body_exited(body: Node2D) -> void:
	pass
