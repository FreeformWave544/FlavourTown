extends Control

var level_1 := preload("res://Levels/level_1.tscn")
var optionsMenu := preload("res://UI/scenes/menus/options_menu/master_options_menu_with_tabs.tscn")

func _on_options_pressed() -> void: add_child(optionsMenu.instantiate())

func _on_start_pressed() -> void: get_tree().change_scene_to_packed(level_1)
