extends Node2D

@onready var anim: AnimationPlayer = $"../AnimationPlayer"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.reset()
