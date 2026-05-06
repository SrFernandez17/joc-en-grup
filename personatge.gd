extends CharacterBody2D
const SPEED = 100.0
@onready var RATA: Sprite2D = $RATA

func _ready() -> void:
	position.x = 200
	position.y = 500

func _physics_process(delta: float) -> void:

	var direccio = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = direccio * SPEED
	move_and_slide()
	RATA.position = position
