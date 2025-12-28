extends Control

signal stopped
signal running
signal paused

@onready var play_button: TextureButton = $play_pause_stop_V/play_pause_stop_H/play_pause/play
@onready var pause_button: TextureButton = $play_pause_stop_V/play_pause_stop_H/play_pause/pause
@onready var stop_button: TextureButton = $play_pause_stop_V/play_pause_stop_H/stop/stop


func _ready() -> void:
	pass
	
	
func ui_running() -> void:
	play_button.hide()
	pause_button.show()
	
	
func ui_paused() -> void:
	play_button.show()
	pause_button.hide()
	
	
func ui_stopped() -> void:
	play_button.show()
	pause_button.hide()
	
	
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
	
	
