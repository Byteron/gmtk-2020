extends Node

var current_level := 0

var sheeps := 0
var max_sheeps := 0


func _ready() -> void:
	Scene.register_scene("TitleScreen", "res://source/menu/TitleScreen.tscn")
	Scene.register_scene("GameOver", "res://source/menu/GameOver.tscn")
	Scene.register_scene("Victory", "res://source/menu/Victory.tscn")
	Scene.register_scene("Credits", "res://source/menu/Credits.tscn")
	
	Scene.register_scene("Level1", "res://source/level/levels/Level1.tscn")
	Scene.register_scene("Level2", "res://source/level/levels/Level2.tscn")
	Scene.register_scene("Level3", "res://source/level/levels/Level3.tscn")
	Scene.register_scene("Level4", "res://source/level/levels/Level4.tscn")
	Scene.register_scene("Level5", "res://source/level/levels/Level5.tscn")
	Scene.register_scene("Level6", "res://source/level/levels/Level6.tscn")
	Scene.register_scene("Level7", "res://source/level/levels/Level7.tscn")
	
	load_game()

	SFX.play_sfx("Wind")
	SFX.play_sfx("Music")


func new_game() -> void:
	current_level = 1
	save_game()
	Scene.change("Level1", true)


func increase_level() -> void:
	current_level += 1
	save_game()

func decrease_level() -> void:
	current_level -= 1
	save_game()


func reset_level() -> void:
	current_level = 0
	save_game()


func continue_game() -> void:
	var next_level = "Level%d" % current_level
	
	if Scene.has_scene(next_level):
		Scene.change(next_level, true)
	else:
		reset_level()
		Scene.change("Credits", true)


func load_game() -> void:
	var save_game = load("user://save_game.tres")
	
	if save_game:
		current_level = save_game.data["Level"]
	
	else:
		current_level = 1


func save_game() -> void:
	var save_game = SaveGame.new()
	save_game.data["Level"] = current_level
	ResourceSaver.save('user://save_game.tres', save_game)
