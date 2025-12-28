extends ConfigFile

const PATH := "user://config.cfg"

func load_config() -> void:
	load(PATH)

func get_minutes() -> int:
	return get_value("timer", "minutes", 25)

func get_seconds() -> int:
	return get_value("timer", "seconds", 0)

func save_time(minutes: int, seconds: int) -> void:
	set_value("timer", "minutes", minutes)
	set_value("timer", "seconds", seconds)
	save(PATH)
