extends Node2D

@onready var highscore = $Control/HighScore
@onready var main = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	
	if not FileAccess.file_exists("user://savegame.save"):
		
		return
		
	var save_game = FileAccess.open("user://savegame.save", FileAccess.READ)
	
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		print(node_data)
		highscore.text = "Your Score: " + str(node_data["score"]) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	# Reset nyawa ke nilai awal (misalnya, 3 atau nilai yang sesuai dengan permainan Anda)
	PlayerStats.health = PlayerStats.max_health

	# Ganti scene ke scene awal atau level pertama
	get_tree().change_scene_to_file("res://world.tscn")
	# Atau, jika Anda ingin memulai dari level tertentu setelah game over, sesuaikan dengan level yang Anda inginkan.
	# get_tree().change_scene("res://path_to_your_starting_level.tscn")
	pass  # Gantilah dengan tubuh fungsi yang sesuai.


func _on_exit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_back_pressed():
	get_tree().change_scene_to_file("res://start.tscn")
	pass # Replace with function body.
