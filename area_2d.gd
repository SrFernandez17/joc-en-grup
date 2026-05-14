extends Area2D

@export var velocitat = 600
var direction = Vector2.ZERO
func _ready() -> void:
	pass # Replace with function body.



	

func _process(delta: float) -> void:
	position += direction * velocitat * delta


func _on_timer_timeout() -> void:
	queue_free()
