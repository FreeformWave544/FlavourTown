extends RigidBody2D

@export var complaints: Array[String] = ["Onions emotionally manipulate people.", "I despise lettuce, biting into it releases a crunch, despise it looking soft - it is deceitful.", "I wish harm upon whatever freaks of nature like lettuce enough to breed more of it.", "Who wants to eat leaves? I AM NOT A RABBIT!", "My disgust at spelling it 'flavour'town is almost as much as my disgust for lettuce."]

func _ready() -> void:
	$ColorRect/Label.text = complaints.pick_random()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player or body is UnderPlayer:
		body.reset()
