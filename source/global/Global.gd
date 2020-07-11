extends Node

func _ready() -> void:
	Scene.register_scene("TitleScreen", "res://source/menu/TitleScreen.tscn")
	Scene.register_scene("Game", "res://source/game/Game.tscn")
	
	Scene.register_scene("Level1", "res://source/level/levels/Level1.tscn")
	Scene.register_scene("Level2", "res://source/level/levels/Level2.tscn")
