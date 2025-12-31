extends Node2D

var slip = preload("res://Levels/slip.tscn")
@export var positions: Array[Vector2]

func _ready() -> void:
	await get_tree().create_timer(5).timeout
	slipLoop()

const VIEW_W := 1152
const VIEW_H := 648
const SLIP_W := 192
const SLIP_H := 108
const BUFFER := 40

func slipLoop() -> void:
	for i in range(len(positions)):
		#if i in [10, 15]:
			#$Floor.set_collision_mask_value(2, false)
			#$Floor.set_collision_layer_value(3, false)
			#await get_tree().create_timer(1.0).timeout
			#$Floor.set_collision_mask_value(2, true)
			#$Floor.set_collision_layer_value(3, true)
		await get_tree().create_timer(randf_range(0.2, 5.3)).timeout
		var slipInstance: RigidBody2D = slip.instantiate()
		slipInstance.global_position = positions[i]
		add_child(slipInstance)
		var direction = (($Player.global_position + Vector2(randi_range(-150, 150), randi_range(-150, 150))) - slipInstance.global_position).normalized()
		slipInstance.apply_central_impulse(direction * randf_range(500.0, 1000.0))
	await get_tree().create_timer(3.0).timeout
	$Label3.text = "VVV"
	$Label3.modulate = Color(1.0, 1.0, 1.0)
	for i in range(8):
		$Floor.set_collision_layer_value(i + 1, false)
		$Floor.set_collision_mask_value(i + 1, false)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is UnderPlayer:
		next_level()

@export var levelDir := "res://Levels/"
func next_level() -> void:
	#NOTE If you make a level 10, split at _ and do cool stuffs to do stuffs that are cool.
	var nextLevel := levelDir + "level_" + (str(int(str(name)[-1]) + 1)) + ".tscn"
	if ResourceLoader.exists(nextLevel): get_tree().call_deferred("change_scene_to_file", nextLevel)
	else: get_tree().call_deferred("change_scene_to_file", "res://Levels/Win.tscn")
