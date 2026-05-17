extends Area2D

@export var velocitat = 600
var direction : Vector2=Vector2.RIGHT
func _ready() -> void:
	pass # Replace with function body.



	

func _process(delta: float) -> void:
	position += direction * velocitat * delta





func _on_area_entered(area: Area2D) -> void:
	if area.has_method("die") or area.name.to_lower().contains("enemic"):
		if area.has_method("die"):
			area.die()
		else:
			area.queue_free()
		
	 
		queue_free()


func _on_timer_timeout() -> void:
		queue_free()
