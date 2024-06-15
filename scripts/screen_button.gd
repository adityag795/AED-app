extends TextureButton
class_name ScreenButton
# Use this name ☝️ insde any script to check if something is a screen button OR not.

signal clicked(button)

func _on_pressed() -> void:
	# 👇 "self" refers to the object to which the script is attached to.
	clicked.emit(self)
