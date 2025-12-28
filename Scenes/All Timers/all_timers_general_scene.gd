extends Node2D

@onready var work_timer: Node2D = $work_timer_scene
@onready var timer_controls: Control = $timer_controls

enum State { STOPPED, RUNNING, PAUSED, ENDED }
var state: State = State.STOPPED

var user_minutes: int = 1
var user_seconds: int = 25


func _ready() -> void:
	set_time_in_timer()
	pass
	
	
func change_state(new_state: State) -> void:
	if state == new_state:
		return
	if  state == State.STOPPED and new_state == State.PAUSED:
		return
	if (state == State.ENDED) and (new_state == State.PAUSED or new_state == State.STOPPED):
		return
	
	state = new_state
	
	match state:
		State.RUNNING:
			print("Плей нажат!")
			work_timer.timer_started()
			timer_controls.ui_running()
		State.STOPPED:
			print("Стоп нажат!")
			work_timer.timer_stopped()
			timer_controls.ui_stopped()
			work_timer.set_time(user_minutes, user_seconds)
		State.PAUSED:
			print("Пауза нажата!")
			work_timer.timer_paused()
			timer_controls.ui_paused()
		State.ENDED:
			print("Время и стекло")
	
	
func set_time_in_timer() -> void:
	work_timer.set_time(user_minutes, user_seconds)
	pass
	
	
func _on_timer_controls_running() -> void:
	change_state(State.RUNNING)
	
	
func _on_timer_controls_stopped() -> void:
	change_state(State.STOPPED)
	
	
func _on_timer_controls_paused() -> void:
	change_state(State.PAUSED)
	
	
func _on_work_timer_scene_timer_finished() -> void:
	change_state(State.ENDED)
