extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var canDouble := true
var doubles := 1 ; var doubleCount := 0

func _physics_process(delta: float) -> void:
	if not is_on_floor(): velocity += get_gravity() * delta
	else: canDouble = true ; doubleCount = 0
	if Input.is_action_just_pressed("ui_accept") and (is_on_floor() or canDouble):
		if canDouble: doubleCount += 1
		if doubleCount > doubles: canDouble = false
		velocity.y = JUMP_VELOCITY
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		$Sprite2D.flip_h = direction > 0
	else: velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func reset(...args) -> void:
	if !is_inside_tree(): return
	if "shake" in args: GameManager.shake = true
	get_tree().call_deferred("reload_current_scene")
