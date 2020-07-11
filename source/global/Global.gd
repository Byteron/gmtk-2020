extends Node

var current_level := 0

func _ready() -> void:
	Scene.register_scene("TitleScreen", "res://source/menu/TitleScreen.tscn")
	Scene.register_scene("Game", "res://source/game/Game.tscn")
	
	Scene.register_scene("Level1", "res://source/level/levels/Level1.tscn")
	Scene.register_scene("Level2", "res://source/level/levels/Level2.tscn")
	
	load_game()
<<<<<<< HEAD
=======
	
	SFX.play_sfx("Wind")
>>>>>>> a82496373019b4d11c37d11d8f81efe884a290da


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
