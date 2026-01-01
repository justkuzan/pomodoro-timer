extends AudioStreamPlayer


enum AUDIO_TRACKS { ui_button_pressed, ui_button_released, maint_theme, wind, sound_of_wheels }


const  AUDIO_TRACKS_PATHS: Dictionary = {
	AUDIO_TRACKS.ui_button_pressed: preload("res://UI/HUD/Sounds/Wood Block1.ogg"),
	AUDIO_TRACKS.ui_button_released: preload("res://UI/HUD/Sounds/Wood Block2.ogg")
	}
	
	
func play_track(track: AUDIO_TRACKS) -> void:
	stream = AUDIO_TRACKS_PATHS.get(track)
	play()
