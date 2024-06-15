extends TextureButton
class_name TouchButton

signal clicked(button) # "button" is taken as arguement

func _on_pressed() -> void:
	# 👇 "self" refers to the object to which the script is attached to.
	clicked.emit(self)
