extends Node2D

func _ready() -> void:
	for child in get_child(0).get_child(1).get_children():
		child.get_child(0).body_entered.connect(reset)
	$"../AnimationPlayer".play("ON", -1, randf_range(0.70, 1.50))

func reset(body = null) -> void:
	if body is Player: 
		get_parent().find_child("Player").reset()
		$"../AnimationPlayer".stop()
		$"../AnimationPlayer".play("ON", -1, randf_range(0.70, 1.50))
