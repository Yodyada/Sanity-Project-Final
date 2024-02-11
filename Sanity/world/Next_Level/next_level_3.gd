extends Area2D

const FILE_BEGIN = "res://world/Map_Level/0"

func _on_body_entered(body):
	if body.is_in_group("Player"):
		#Check ว่าตัวละครโดน Portal แล้วจะแสดงผลไหม
		print("collided with player")
		
		var current_scene_file = get_tree().current_scene.scene_file_path
		#Check ว่าตัวละครโดน Portal แล้วจะแสดงผลไหม
		print(current_scene_file)
		
		var next_level_number = (current_scene_file.to_int() + 5) - (current_scene_file.to_int() + 1)
		#Check ว่าต่อไปจะเป็น level 2 ไหม
		print(next_level_number)
		
		var next_level_path = FILE_BEGIN + str(next_level_number) + "/bg_0"  + str(next_level_number) + ".tscn"
		#Check ว่าต่อไปจะเป็น level 2 ไหม
		print(next_level_path)
		
		get_tree().change_scene_to_file(next_level_path)
