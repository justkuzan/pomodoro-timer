extends Node2D

@onready var work_timer_scene: Node2D = $work_timer_scene
@onready var timer_controls: Control = $timer_controls

enum State { STOPPED, RUNNING, PAUSED }
var state: State = State.STOPPED


func _ready() -> void:
	pass


#func _process(delta: float) -> void:
	#pass


func _on_timer_controls_stopped() -> void:
	print("Стоп нажат!")


func _on_timer_controls_running() -> void:
	print("Плей нажат!")


func _on_timer_controls_paused() -> void:
	print("Пауза нажата!")
