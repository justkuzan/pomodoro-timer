extends Node

const MUTE_BUSES := ["Music", "Ambient", "FX", "UI"]

var is_muted: bool = false

func _set_buses_muted(muted: bool) -> void:
	for bus_name: String in MUTE_BUSES:
		var idx := AudioServer.get_bus_index(bus_name)
		if idx >= 0:
			AudioServer.set_bus_mute(idx, muted)
	
	
func sound_on() -> void:
	is_muted = false
	_set_buses_muted(false)
	
	
func sound_off() -> void:
	is_muted = true
	_set_buses_muted(true)
	
	
func onloaded() -> void:
	$main_theme.play()
	$wind.play()
	$birds.play()
	
	
func running() -> void:
	#$main_theme.play() Не надо - уже запущена
	$wind.play()
	$birds.stop()
	#сюда нужен звук гудка
	$train_wheels.play()
	
	
func stopped() -> void:
	#$main_theme.play() Не надо - уже запущена
	$wind.stop()
	$birds.play()
	$train_wheels.stop()
	
	
func paused() -> void:
	#$main_theme.play() Не надо - уже запущена
	$wind.stop()
	$birds.play()
	#сюда нужен звук плавного снижения скорости
	$train_wheels.stop()
	
	
func ended() -> void:
	#$main_theme.play() Не надо - уже запущена
	$wind.stop()
	$birds.play()
	#сюда нужен звук плавного снижения скорости
	#сюда нужен звук гудка
	$train_wheels.stop()
	
	
func button_pressed() -> void:
	if is_muted: return
	$ui/button_press.play()
	
	
func button_released() -> void:
	if is_muted: return
	$ui/button_release.play()
	
	
