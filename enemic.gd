extends Area2D
var velocitat = randf_range(80,100)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocitat = randf_range(60,80)
	var posicioX = randf_range(-500,500)
	var posicioY = randf_range(-500,500)
	position.x = posicioX
	position.y = posicioY

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var posicio_jugador: Vector2 = Global.Jugador.global_position
	var direccio: Vector2 = global_position.direction_to(posicio_jugador)
	global_position += direccio * velocitat * delta
