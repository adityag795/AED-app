extends Control

var current_scene = null
var fade_dur = 0.15
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	register_buttons()
	#change_screen(Global.cur_scene)

func register_buttons():
	var buttons = get_tree().get_nodes_in_group("buttons")
	if buttons.size() > 0:
		for button in buttons:
			if button is TouchButton:
				button.clicked.connect(_on_button_pressed)

func _on_button_pressed(button):
	# print(button.name)
	# Since, button.name is unique, a switch case can be created
	match button.name:
		"Option1":
			print("Option 1 pressed.")
			animation_player.play("RESET")
			Global.selected_option = 1
		"Option2":
			print("Option 2 pressed.")
			animation_player.play("select_option2")
			Global.selected_option = 2
		"Option3":
			print("Option 3 pressed.")
			animation_player.play("select_option3")
			Global.selected_option = 3
		"Option4":
			print("Option 4 pressed.")
			animation_player.play("select_option4")
			Global.selected_option = 4
		"Option5":
			print("Option 5 pressed.")
			animation_player.play("select_option5")
			Global.selected_option = 5
		"Start_Btn":
			print("Start Btn pressed.")
			change_screen($"../AED4AdultMale")
		"ExitButton":
			print("Exit btn pressed.")

func _process(delta: float) -> void:
	pass

func change_screen(new_screen):
	if current_scene != null:
		var disappear_tween = current_scene.disappear()
		await(disappear_tween.finished)
		current_scene.visible = false
	current_scene = new_screen
	if current_scene != null:
		var appear_tween = current_scene.appear()
		await(appear_tween.finished)
		get_tree().call_group("buttons", "set_disabled", false)

func appear():
	visible = true
	# 👇 creating a tween object to animate "modulate.a" property
	var tween = get_tree().create_tween()
	# ☝️ Tween is light-weight object good for animsting numerical properties
	
	# 👇 Tweens also get disabled when the get_scene_tree() is paused.
	# 👇 So we changed the Screens's root node's Process mode to "Always"
	# 👇 After that we need to change tween's PAUSE MODE as shown below
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	
	# 👇 Takes the modulate's alpha property to change to "1" from current value in duration of "0.5 seconds".
	tween.tween_property(self, "modulate:a", 1.0, fade_dur)
	# 👇 Returns the object so that it can be saved and triggered with some delay
	return tween
	
# 👇 To turn OFF the scene visibility	
func disappear():
	# 👇 As soon as screen starts disappearing, we diable all the buttons
	get_tree().call_group("buttons", "set_disabled", true)
	# ☝️ To disable button clicks while the screens are fading out.
	# visible = false 👈Set this in change_screen() after awaiting "finished" signal
	var tween = get_tree().create_tween()
	
	# 👇 Tweens also get disabled when the get_scene_tree() is paused.
	# 👇 So we changed the Screens's root node's Process mode to "Always"
	# 👇 After that we need to change tween's PAUSE MODE as shown below
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	# 👇 Takes the modulate's alpha property to change to "0" from current value in duration of "0.5 seconds".
	tween.tween_property(self, "modulate:a", 0.0, fade_dur)
	return tween
