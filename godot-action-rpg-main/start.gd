extends Node


# Called when the node enters the scene tree for the first time.
# autoload.gd (misalnya, skrip yang memuat secara otomatis)

func _ready():
	if game_should_start_in_main_menu:
		get_tree().change_scene_to_file("res://start.tscn")
	else:
		get_tree().change_scene_to_file("res://world.tscn")




