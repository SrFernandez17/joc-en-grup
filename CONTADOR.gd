extends Label
@onready var CONTADOR = $"CONTADOR TEMPS"

func _process(delta: float) -> void:
	text = CONTADOR.tempstr
