extends AudioStreamPlayer


enum AUDIO_TRACKS {
	ui_button_pressed,
	ui_button_released,
	main_theme,
	wind,
	birds,
	train_wheels
	}


const  AUDIO_TRACKS_PATHS: Dictionary = {
	AUDIO_TRACKS.ui_button_pressed: preload("res://UI/HUD/Sounds/Wood Block1.ogg"),
	AUDIO_TRACKS.ui_button_released: preload("res://UI/HUD/Sounds/Wood Block2.ogg"),
	AUDIO_TRACKS.main_theme: preload ("res://Assets/Audio/Themes/main_theme.ogg"),
	AUDIO_TRACKS.wind: preload ("res://Assets/Audio/Ambient/Ambiance_Wind_Calm_Loop_Stereo.ogg"),
	AUDIO_TRACKS.birds: preload ("res://Assets/Audio/Ambient/Ambiance_Nature_Meadow_Birds_Flies_Calm_Loop_Stereo.ogg"),
	AUDIO_TRACKS.train_wheels: preload ("res://Assets/Audio/Mechanisms/train_wheels.ogg")
	}
	
	
func play_track(track: AUDIO_TRACKS) -> void:
	stream = AUDIO_TRACKS_PATHS.get(track)
	play()
	
func stop_track(track: AUDIO_TRACKS) -> void:
	stream = AUDIO_TRACKS_PATHS.get(track)
	stop()
	
func onloaded() -> void:
	play_track(SoundManager.AUDIO_TRACKS.main_theme)
	play_track(SoundManager.AUDIO_TRACKS.birds)
	play_track(SoundManager.AUDIO_TRACKS.wind)
	
	
func running() -> void:
	SoundManager.play_track(SoundManager.AUDIO_TRACKS.train_wheels)
	
	
func stopped() -> void:
	SoundManager.stop_track(SoundManager.AUDIO_TRACKS.train_wheels)
	
	
#enum State { ONLOADED, STOPPED, RUNNING, PAUSED, ENDED }
		
