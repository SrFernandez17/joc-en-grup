extends Control


# Called when the node enters the scene tree for the first time.


func _on_començar_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")


func _on_opcions_pressed() -> void:
	get_tree().change_scene_to_file("res://idioma.tscn")


func _on_sortir_pressed() -> void:
	get_tree().quit()
