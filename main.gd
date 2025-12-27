extends Node2D

@export var levelDir := "res://Levels/"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		next_level()

func next_level() -> void:
	#NOTE If you make a level 10, split at _ and do cool stuffs to do stuffs that are cool.
	var nextLevel := levelDir + "level_" + (str(int(str(name)[-1]) + 1)) + ".tscn"
	print(nextLevel)
	if ResourceLoader.exists(nextLevel):
		get_tree().call_deferred("change_scene_to_file", nextLevel)
	else:
		get_tree().call_deferred("change_scene_to_file", "res://Levels/Win")
