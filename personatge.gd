extends CharacterBody2D
const SPEED = 100.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@export var escena_bala: PackedScene
var last_dir: Vector2 = Vector2.ZERO

func _ready() -> void:
	Global.Jugador = self
	position.x = 200
	position.y = 500

func _physics_process(_float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		dispara()
	var direccio = Input.get_vector("esquerra","dreta","amunt","avall")
	velocity = direccio * SPEED
	move_and_slide()
	
	if not direccio.is_zero_approx():
		last_dir=direccio
	anima(velocity)
	

func dispara():
	var bala = escena_bala.instantiate()
	%Bales.add_child(bala)
	bala.global_position = global_position
	bala.direction = last_dir

func anima(velocity:Vector2):
	if velocity.x > 0:
		animated_sprite_2d.play("corre")
		animated_sprite_2d.flip_h = false 
	elif velocity.x < 0:
		animated_sprite_2d.play("corre")
		animated_sprite_2d.flip_h = true
	
	elif velocity.y != 0:
		animated_sprite_2d.play("corre")
	else:
		animated_sprite_2d.play("aturat") 
		


func _on_audio_stream_player_2d_finished() -> void:
	$AudioStreamPlayer.play()
