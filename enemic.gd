extends Area2D
var velocitat = randf_range(60,100)
@onready var animated_sprite_2d = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocitat = randf_range(60,80)
	var posicioX = randf_range(-1500,1500)
	var posicioY = randf_range(-1500,1500)
	position.x = posicioX
	position.y = posicioY

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_instance_valid(Global.Jugador):
		var posicio_jugador: Vector2 = Global.Jugador.global_position
		var direccio: Vector2 = global_position.direction_to(posicio_jugador)
		global_position += direccio * velocitat * delta
		anima(direccio * velocitat)

func anima(velocitat: Vector2):
	if velocitat.x > 0:
		animated_sprite_2d.play("MOVIMENT")
		animated_sprite_2d.flip_h = false 
	elif velocitat.x < 0:
		animated_sprite_2d.play("MOVIMENT")
		animated_sprite_2d.flip_h = true
	
	elif velocitat.y != 0:
		animated_sprite_2d.play("MOVIMENT")
func die() -> void:
	Global.KILLS +=1
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if is_instance_valid(Global.Jugador) and body == Global.Jugador:
		get_tree().quit()
