extends Control

signal quit
signal sound_on
signal sound_off


@onready var quit_button: TextureButton = $buttons_V/buttons_H/left_buttons/quit
@onready var sound_on_button: TextureButton = $buttons_V/buttons_H/right_buttons/sound_on
@onready var sound_off_button: TextureButton = $buttons_V/buttons_H/right_buttons/sound_off


func _ready() -> void:
	var all_buttons: Array = [
		quit_button,
		sound_on_button,
		sound_off_button,
	]
	
	for btn: TextureButton in all_buttons:
		btn.button_down.connect(play_click_down)
		btn.button_up.connect(play_click_up)
	
	
func play_click_down() -> void:
	AudioManager.button_pressed()
	
	
func play_click_up() -> void:
	AudioManager.button_released()
	
	
func _on_quit_pressed() -> void:
	emit_signal("quit")
	
	
func _on_sound_on_pressed() -> void:
	sound_on_button.hide()
	sound_off_button.show()
	emit_signal("sound_on")
	
	
func _on_sound_off_pressed() -> void:
	sound_on_button.show()
	sound_off_button.hide()
	emit_signal("sound_off")
	
	
