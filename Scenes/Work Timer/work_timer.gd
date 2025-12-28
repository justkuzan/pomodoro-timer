extends Node2D

@onready var timer: Timer = $work_timer
@onready var time_counter: Label = $time_counter

var minutes: int
var seconds: int

signal timer_finished

func _ready() -> void:
	set_time()
	pass
	
	
func set_time(set_minutes: int = 25, set_seconds: int = 0) -> void:
	minutes = set_minutes
	seconds = set_seconds
	time_counter.text = "%02d:%02d" % [minutes, seconds]
	
	
func timer_onloaded() -> void:
	pass
	
	
func timer_started() -> void:
	timer.start()
	
	
func timer_stopped() -> void:
	timer.stop()
	
	
func timer_paused() -> void:
	timer.stop()
	
	
func _on_work_timer_timeout() -> void:
	print("1 second has passed")
	time_counter.text = "%02d:%02d" % [minutes, seconds]
	
	if minutes <= 0 and seconds <= 0:
		emit_signal("timer_finished")
		timer_stopped()
		return
		
	if seconds > 0:
		seconds -= 1
		
	elif seconds == 0 and minutes > 0:
		minutes -= 1
		seconds = 59
