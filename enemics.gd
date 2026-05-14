extends Node2D
@export var escena_enemic: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var enemic = escena_enemic.instantiate()
	%ENEMICS.add_child(enemic)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
