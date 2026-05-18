extends CharacterBody2D
const SPEED = 100.0
@onready var animated_sprite_2d = $AnimatedSprite2D
@export var escena_bala: PackedScene
var last_dir: Vector2 = Vector2.ZERO

var posicioX = randf_range(-1300,1970) 
var posicioY = randf_range(-860,1500)

func _ready() -> void:
	Global.Jugador = self
	position.x = posicioX
	position.y = posicioY
	last_dir=Vector2.RIGHT

func _physics_process(_float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		dispara()
	var direccio = Input.get_vector("esquerra","dreta","amunt","avall")
	velocity = direccio * SPEED
	move_and_slide()
	
	if Input.is_action_just_pressed("REROLL"):
		var posicioX = randf_range(-1300,1900)
		var posicioY = randf_range(-860,1500)
		position.x = posicioX
		position.y = posicioY
	
	if not direccio.is_zero_approx():
		last_dir=direccio
	anima(velocity)
	

func dispara():
	var bala = escena_bala.instantiate()
	%Bales.add_child(bala)
	bala.global_position = global_position
	bala.direction = last_dir
	if last_dir!=Vector2.ZERO:
		bala.direction=last_dir
	else:
		bala.direction=Vector2.RIGHT

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

func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()
