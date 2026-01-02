extends Node2D

signal onloaded
signal stopped
signal running
signal paused
signal ended

@onready var work_timer: Node2D = $work_timer_scene
@onready var timer_controls: Control = $timer_controls

var config := preload("res://config.gd").new()

enum State { ONLOADED, STOPPED, RUNNING, PAUSED, ENDED }
var state: State = State.STOPPED


var user_minutes: int = 25
var user_seconds: int = 0


func _ready() -> void:
	change_state(State.ONLOADED)
	
	#window setting (need to be in Main scene)
	if not Engine.is_editor_hint():
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	
	
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
			emit_signal("running")
		
		State.STOPPED:
			print("Стоп нажат!")
			work_timer.timer_stopped()
			timer_controls.ui_stopped()
			set_time_in_timer()
			emit_signal("stopped")
		
		State.PAUSED:
			print("Пауза нажата!")
			work_timer.timer_paused()
			timer_controls.ui_paused()
			emit_signal("paused")
		
		State.ENDED:
			print("Время и стекло")
			timer_controls.ui_ended()
			set_time_in_timer()
			emit_signal("ended")
		
		State.ONLOADED:
			timer_controls.ui_onloaded()
			var err := config.load("user://config.cfg")
			if err != OK:
				print("Config file not found")
			user_minutes = config.get_minutes()
			user_seconds = config.get_seconds()
			set_time_in_timer()
			emit_signal("onloaded")
	
	
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
	
	
func _on_timer_controls_minutes_added() -> void:
	if user_minutes >= 55:
		return
	user_minutes += 5
	set_time_in_timer()
	config.save_time(user_minutes, user_seconds)
	
	
func _on_timer_controls_minutes_reduced() -> void:
	if user_minutes <= 5:
		return
	user_minutes -= 5
	set_time_in_timer()
	config.save_time(user_minutes, user_seconds)
	
	
