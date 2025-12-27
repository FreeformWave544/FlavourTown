extends Node2D

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")

func _on_quit_pressed() -> void:
	$Panel/FlowContainer/Label.text = "You're On Web...\nClose The TAB Yourself..."
