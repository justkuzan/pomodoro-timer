extends Node2D

@onready var work_timer: Node2D = $work_timer_scene
@onready var timer_controls: Control = $timer_controls

enum State { STOPPED, RUNNING, PAUSED }
var state: State = State.STOPPED

var user_minutes: int = 12
var user_seconds: int = 20


func _ready() -> void:
	set_time_in_timer()
	pass
	
	
func set_time_in_timer() -> void:
	work_timer.set_time(user_minutes, user_seconds)
	pass
	
	
func _on_timer_controls_running() -> void:
	print("Плей нажат!")
	work_timer.timer_started()
	
	
func _on_timer_controls_stopped() -> void:
	print("Стоп нажат!")
	work_timer.timer_stopped()
	work_timer.set_time(user_minutes, user_seconds)
	
	
func _on_timer_controls_paused() -> void:
	print("Пауза нажата!")
	work_timer.timer_paused()
	
	
func _on_work_timer_scene_timer_finished() -> void:
	pass
