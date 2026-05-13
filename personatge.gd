extends CharacterBody2D
const SPEED = 100.0
@onready var RATA: Sprite2D = $RATA

@export var escena_bala: PackedScene
var last_dir: Vector2 = Vector2.ZERO

func _ready() -> void:
	position.x = 200
	position.y = 500

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		dispara()
	var direccio = Input.get_vector("esquerra","dreta","amunt","avall")
	velocity = direccio * SPEED
	move_and_slide()
	RATA.position = position
	if not direccio.is_zero_approx():
		last_dir=direccio
	

func dispara():
	var bala = escena_bala.instantiate()
	%Bales.add_child(bala)
	bala.global_position = global_position
	bala.direction = last_dir
