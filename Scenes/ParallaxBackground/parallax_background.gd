extends Node2D

@onready var parallax_1: Parallax2D = $parallax1
@onready var parallax_2: Parallax2D = $parallax2
@onready var parallax_3: Parallax2D = $parallax3
@onready var parallax_4: Parallax2D = $parallax4



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
	
#func _process(delta: float) -> void:
	#pass
	
	
func parallax_start() -> void:
	parallax1()
	parallax2()
	parallax3()
	parallax4()
	
func parallax_stop() -> void:
	pass #Сделать стейты?
	
func parallax1() -> void:
	parallax_1.autoscroll = Vector2(0.0, 0.0)
	
	
func parallax2() -> void:
	parallax_2.autoscroll = Vector2(-10.0, 0.0)
	
	
func parallax3() -> void:
	parallax_3.autoscroll = Vector2(-50.0, 0.0)
	
	
func parallax4() -> void:
	parallax_4.autoscroll = Vector2(-130.0, 0.0)
