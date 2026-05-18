extends Timer
var temps = 0
var tempstr = "0"
func _on_contador_temps_timeout() -> void:
	temps += 1
	tempstr = str(temps)
