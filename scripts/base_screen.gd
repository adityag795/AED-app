extends Control

func _ready():
	
	visible = false
	modulate.a = 0.0
	
	get_tree().call_group("buttons", "set_disabled", true)

func appear():
	
	visible = true
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 0.15)
	return tween

func disappear():
	
	get_tree().call_group("buttons", "set_disabled", true)
	visible = false
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 0.15)
	return tween
