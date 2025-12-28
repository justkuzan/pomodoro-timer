extends Control

signal stopped
signal running
signal paused
signal minutes_added
signal minutes_reduced


@onready var play_button: TextureButton = $play_pause_stop_V/play_pause_stop_H/play_pause/play
@onready var pause_button: TextureButton = $play_pause_stop_V/play_pause_stop_H/play_pause/pause
@onready var stop_button: TextureButton = $play_pause_stop_V/play_pause_stop_H/stop/stop
@onready var add_minutes_button: TextureButton = $add_reduce_V/add_reduce_H/add_minutes
@onready var reduce_minutes_button: TextureButton = $add_reduce_V/add_reduce_H/reduce_minutes


func _ready() -> void:
	pass
	
	
func ui_onloaded() -> void:
	play_button.show()
	pause_button.hide()
	stop_button.hide()
	add_minutes_button.show()
	reduce_minutes_button.show()
	
	
func ui_running() -> void:
	play_button.hide()
	pause_button.show()
	stop_button.show()
	add_minutes_button.hide()
	reduce_minutes_button.hide()
	
	
func ui_paused() -> void:
	play_button.show()
	pause_button.hide()
	stop_button.show()
	add_minutes_button.hide()
	reduce_minutes_button.hide()
	
	
func ui_stopped() -> void:
	play_button.show()
	pause_button.hide()
	stop_button.hide()
	add_minutes_button.show()
	reduce_minutes_button.show()
	
	
func ui_ended() -> void:
	play_button.show()
	pause_button.hide()
	stop_button.hide()
	add_minutes_button.show()
	reduce_minutes_button.show()
	
	
func _on_add_minutes_pressed() -> void:
	emit_signal("minutes_added")
	
	
func _on_reduce_minutes_pressed() -> void:
	emit_signal("minutes_reduced")
	
	
func _on_play_pressed() -> void:
	emit_signal("running")
	
	
func _on_stop_pressed() -> void:
	emit_signal("stopped")
	
	
func _on_pause_pressed() -> void:
	emit_signal("paused")
	
	
