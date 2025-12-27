extends Node2D

func _ready() -> void:
	for child in get_child(0).get_child(1).get_children():
		child.get_child(0).body_entered.connect(reset)

func reset(body = null) -> void:
	if body is Player:
		print(body, " RESET:: <<")
		get_parent().find_child("Player").reset()
