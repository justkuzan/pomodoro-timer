extends Control

signal quit
signal music_on
signal music_off


@onready var quit_button: TextureButton = $buttons_V/buttons_H/left_buttons/quit
@onready var music_on_button: TextureButton = $buttons_V/buttons_H/right_buttons/music_on
@onready var music_off_button: TextureButton = $buttons_V/buttons_H/right_buttons/music_off


func _ready() -> void:
	var all_buttons: Array = [
		quit,
		music_off,
	]
	
	for btn: TextureButton in all_buttons:
		btn.button_down.connect(play_click_down)
		btn.button_up.connect(play_click_up)
	
	
func play_click_down() -> void:
	pass
	AudioManager.button_pressed()
	
	
func play_click_up() -> void:
	pass
	AudioManager.button_released()
	
	
func ui_misic_on() -> void:
	music_on_button.show()
	music_off_button.hide()
	
func ui_misic_off() -> void:
	music_on_button.hide()
	music_off_button.show()


func _on_quit_pressed() -> void:
	emit_signal("quit")


func _on_music_on_pressed() -> void:
	emit_signal("music_on")


func _on_music_off_pressed() -> void:
	emit_signal("music_off")
