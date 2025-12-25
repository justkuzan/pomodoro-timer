extends Node2D

@onready var timer: Timer = $work_timer
@onready var time_counter: Label = $time_counter

var timer_minutes_set: int = 1
var timer_seconds_set: int = 5
var minutes: int = 0
var seconds: int = 0

func _ready() -> void:
	timer.start()
	seconds = timer_seconds_set
	minutes = timer_minutes_set
	print("Timer is started")
	pass

func _on_work_timer_timeout() -> void:
	print("1 second has passed")
	time_counter.text = "%02d:%02d" % [minutes, seconds]
	
	if minutes <= 0 and seconds <= 0:
		print("Timer is ended")
		timer.stop()
		return
		
	if seconds > 0:
		seconds -= 1
		
	elif seconds == 0 and minutes > 0:
		minutes -= 1
		seconds = 59
