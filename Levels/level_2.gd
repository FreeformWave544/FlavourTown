extends Node2D

@export var levelDir := "res://Levels/"

func _ready() -> void:
	if GameManager.shake:
		GameManager.shake = false
		$Email.modulate = Color(0.376, 0.0, 0.0, 1.0)
		print($Email.modulate)
		await get_tree().create_timer(0.2).timeout
		$Email.modulate = Color(1.0, 1.0, 1.0, 1.0)
		print($Email.modulate)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		next_level()

func next_level() -> void:
	if $AnimationPlayer.is_playing(): $Player.reset("shake")
	#NOTE If you make a level 10, split at _ and do cool stuffs to do stuffs that are cool.
	var nextLevel := levelDir + "level_" + (str(int(str(name)[-1]) + 1)) + ".tscn"
	print(nextLevel)
	if is_inside_tree() and ResourceLoader.exists(nextLevel):
		get_tree().call_deferred("change_scene_to_file", nextLevel)
