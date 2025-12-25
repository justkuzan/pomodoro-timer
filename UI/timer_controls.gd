extends Control

signal stopped
signal running
signal paused


func _ready() -> void:
	pass


#func _process(delta: float) -> void:
	#pass


func _on_reduce_minutes_pressed() -> void:
	pass


func _on_add_minutes_pressed() -> void:
	pass


func _on_play_pressed() -> void:
	emit_signal("running")


func _on_stop_pressed() -> void:
	emit_signal("stopped")


func _on_pause_pressed() -> void:
	emit_signal("paused")
