extends CharacterBody2D
class_name UnderPlayer

const SPEED = 800.0
const JUMP_VELOCITY = -400.0

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("reset"):
		reset()

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * SPEED
		if direction.x:
			$Sprite2D.flip_h = direction.x > 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func reset(...args) -> void:
	if !is_inside_tree(): return
	if "shake" in args: GameManager.shake = true
	get_tree().call_deferred("reload_current_scene")
