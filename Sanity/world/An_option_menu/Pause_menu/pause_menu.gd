class_name PauseMenu
extends Control

@onready var main = $"../.."


func _on_quit_pressed():
	get_tree().quit()
