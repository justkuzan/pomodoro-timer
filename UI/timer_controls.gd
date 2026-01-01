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
	# Collect all buttons into an array for batch setup
	var all_buttons: Array = [
		play_button, 
		pause_button, 
		stop_button, 
		add_minutes_button, 
		reduce_minutes_button
	]
	
	
	for btn: TextureButton in all_buttons:
		btn.button_down.connect(play_click_down)
		btn.button_up.connect(play_click_up)
		
		
func play_click_down() -> void:
	SoundManager.play_track(SoundManager.AUDIO_TRACKS.ui_button_pressed)
	
	
func play_click_up() -> void:
	SoundManager.play_track(SoundManager.AUDIO_TRACKS.ui_button_released)
	
	
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
	
	
