extends Node2D

func _ready() -> void:
	print("WON")

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")

func _on_quit_pressed() -> void:
	$Panel/FlowContainer/Label.text = "You're On Web...\nClose The TAB Yourself..."

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.keycode == KEY_TAB and "TAB" in $Panel/FlowContainer/Label.text:
		$Panel/FlowContainer/Label.text = "No, 'TAB' key does nothing cool.\nWhy would you press that?"
