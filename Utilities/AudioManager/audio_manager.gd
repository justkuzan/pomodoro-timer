extends Node

#enum State { ONLOADED, STOPPED, RUNNING, PAUSED, ENDED }
		
func _ready() -> void:
	pass
	
	
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
	$ui/button_press.play()
	
	
func button_released() -> void:
	$ui/button_release.play()
	
	
