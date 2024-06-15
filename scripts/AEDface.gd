extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var current_scene = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	register_buttons()

func register_buttons():
	var buttons = get_tree().get_nodes_in_group("buttons")
	if buttons.size() > 0:
		for button in buttons:
			if button is ScreenButton:
				button.clicked.connect(_on_button_pressed)

func _on_button_pressed(button):
	# print(button.name)
	# Since, button.name is unique, a switch case can be created
	match button.name:
		"Power_Btn":
			print("Power button was pressed.")
		"ChildMode_Btn":
			print("Child Mode activated.")
		"Pads_Btn":
			print("Pads Attached succesfully.")
		"Shock_Btn":
			print("Shock delivered.")
		"Module1":
			print("Mod1 pressed.")
			animation_player.play("RESET")
		"Module2":
			print("Mod2 pressed.")
			animation_player.play("Mod2_selected")
		"Module3":
			print("Mod3 pressed.")
			animation_player.play("Mod3_selected")
		"Module4":
			print("Mod4 pressed.")
			animation_player.play("Mod4_selected")
		"Module5":
			print("Mod5 pressed.")
			animation_player.play("Mod5_selected")
		"Start_Btn":
			print("Start btn pressed.")
			get_tree().change_scene_to_file("res://scenes/AED_Mod3.tscn")
		"Exit_Btn":
			get_tree().change_scene_to_file("res://scenes/AEDface.tscn")

func _process(_delta: float) -> void:
	pass
