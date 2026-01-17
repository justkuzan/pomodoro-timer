extends Node2D

@onready var parallax_background: Node2D = $parallax_background
@onready var all_timers_general_scene: Node2D = $all_timers_general_scene


func _ready() -> void:
	pass
	
	
func _on_all_timers_general_scene_running() -> void:
	parallax_background.start()
	AudioManager.running()
	
	
	
func _on_all_timers_general_scene_paused() -> void:
	parallax_background.stop()
	AudioManager.paused()
	
	
func _on_all_timers_general_scene_stopped() -> void:
	parallax_background.stop()
	AudioManager.stopped()
	
	
func _on_all_timers_general_scene_onloaded() -> void:
	AudioManager.onloaded()
	
	
func _on_all_timers_general_scene_ended() -> void:
	parallax_background.stop()
	AudioManager.ended()
	
	
func _on_general_controls_sound_on() -> void:
	AudioManager.sound_on()
	
	
func _on_general_controls_sound_off() -> void:
	AudioManager.sound_off()
	
	
func _on_general_controls_quit() -> void:
	get_tree().quit()
	
	
