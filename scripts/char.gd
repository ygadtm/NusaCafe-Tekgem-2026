extends CharacterBody2D

const SPEED = 130.0
const SPRINT_SPEED = 220.0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
var target_position: Vector2
var is_moving := false
var dir_name := "front"

func _ready() -> void:
	target_position = global_position

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		target_position = get_global_mouse_position()
		is_moving = true

func _physics_process(delta: float) -> void:
	if not is_moving:
		velocity = Vector2.ZERO
		move_and_slide()
		anim.play("idle")
		return

	var current_speed := SPRINT_SPEED if Input.is_action_pressed("Sprint") else SPEED
	var to_target := target_position - global_position
	var distance := to_target.length()

	if distance < 4.0:
		is_moving = false
		velocity = Vector2.ZERO
	else:
		var step_speed := minf(current_speed, distance / delta)
		velocity = to_target.normalized() * step_speed

	var pos_sebelum := global_position
	move_and_slide()

	# Berhenti hanya jika benar-benar tertahan rintangan (aman di FPS tinggi)
	var jarak_seharusnya := velocity.length() * delta
	if is_moving and jarak_seharusnya > 0.0 and global_position.distance_to(pos_sebelum) < jarak_seharusnya * 0.2:
		is_moving = false
		velocity = Vector2.ZERO

	if is_moving and velocity != Vector2.ZERO:
		if abs(velocity.x) > abs(velocity.y):
			dir_name = "left" if velocity.x < 0 else "right"
		else:
			dir_name = "back" if velocity.y < 0 else "front"
		anim.play("walk_" + dir_name)
	else:
		anim.play("idle")
