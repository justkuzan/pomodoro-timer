extends Node2D

@onready var parallax_1: Parallax2D = $parallax1
@onready var parallax_2: Parallax2D = $parallax2
@onready var parallax_3: Parallax2D = $parallax3
@onready var parallax_4: Parallax2D = $parallax4


func _ready() -> void:
	pass
	
	
func start() -> void:
	tween_on_start()
	
	
func stop() -> void:
	tween_on_stop()
	
	
func tween_on_start() -> void:
	var tween_parallax1: Tween = create_tween()
	tween_parallax1.set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween_parallax1.tween_property(parallax_1,"autoscroll",Vector2(0.0, 0.0), 3.0)
	
	var tween_parallax2: Tween = create_tween()
	tween_parallax2.set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween_parallax2.tween_property(parallax_2,"autoscroll",Vector2(-10.0, 0.0), 3.0)
	
	var tween_parallax3: Tween = create_tween()
	tween_parallax3.set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween_parallax3.tween_property(parallax_3,"autoscroll",Vector2(-50.0, 0.0), 3.0)
	
	var tween_parallax4: Tween = create_tween()
	tween_parallax4.set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween_parallax4.tween_property(parallax_4,"autoscroll",Vector2(-130.0, 0.0), 3.0)
	
	
func tween_on_stop() -> void:
	var tween_parallax1: Tween = create_tween()
	tween_parallax1.set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween_parallax1.tween_property(parallax_1,"autoscroll",Vector2(0.0, 0.0), 3.0)
	
	var tween_parallax2: Tween = create_tween()
	tween_parallax2.set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween_parallax2.tween_property(parallax_2,"autoscroll",Vector2(0.0, 0.0), 3.0)
	
	var tween_parallax3: Tween = create_tween()
	tween_parallax3.set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween_parallax3.tween_property(parallax_3,"autoscroll",Vector2(0.0, 0.0), 3.0)
	
	var tween_parallax4: Tween = create_tween()
	tween_parallax4.set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween_parallax4.tween_property(parallax_4,"autoscroll",Vector2(0.0, 0.0), 3.0)
	
