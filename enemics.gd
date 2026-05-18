extends Node2D
@export var escena_enemic: PackedScene
@onready var SPAWN = $SPAWN
@onready var LABEL = $Label
@onready var TEMPO = $TEMPSPERLENEMIC
var temps = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SPAWN.wait_time = 2
	var enemic = escena_enemic.instantiate()
	%ENEMICS.add_child(enemic)
	%ENEMICS.add_child(enemic)
	%ENEMICS.add_child(enemic)
	await get_tree().create_timer(15).timeout

func _process(delta: float) -> void:
	temps = TEMPO.TEMPS
	
func _on_timer_timeout() -> void:
	var enemic = escena_enemic.instantiate()
	%ENEMICS.add_child(enemic)
	
	if temps > 180:
		SPAWN.wait_time = 50/temps
	elif temps > 120:
		SPAWN.wait_time = 0.4
	elif temps > 90:
		SPAWN.wait_time = 0.8
	elif temps > 60:
		SPAWN.wait_time = 1.2
	elif temps > 30:
		SPAWN.wait_time = 1.6
