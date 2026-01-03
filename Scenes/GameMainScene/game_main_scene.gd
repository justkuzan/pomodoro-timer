extends Node2D

@onready var parallax_background: Node2D = $parallax_background
@onready var all_timers_general_scene: Node2D = $all_timers_general_scene


func _ready() -> void:
	pass
	
	
func _on_all_timers_general_scene_running() -> void:
	parallax_background.start()


func _on_all_timers_general_scene_paused() -> void:
	parallax_background.stop()


func _on_all_timers_general_scene_stopped() -> void:
	parallax_background.stop()


func _on_all_timers_general_scene_onloaded() -> void:
	pass


func _on_all_timers_general_scene_ended() -> void:
	parallax_background.stop()
