extends Node2D
@export var escena_enemic: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var enemic = escena_enemic.instantiate()
	%ENEMICS.add_child(enemic)
	await get_tree().create_timer(15).timeout

func _process(delta: float) -> void:
	await get_tree().create_timer(5).timeout

func _on_timer_timeout() -> void:
	var enemic = escena_enemic.instantiate()
	%ENEMICS.add_child(enemic)
