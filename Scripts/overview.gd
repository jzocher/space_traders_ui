extends Control

@onready var anim_player = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/HBoxContainer/GreetingLabel.text += agent_info.agent_name
	$MarginContainer/VBoxContainer/HBoxContainer/CreditsLabel.text += str(agent_info.credits)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_menu_toggle_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if $HBoxContainer/Sidebar.custom_minimum_size[0] == 70:
				anim_player.play("SidebarAnimation")
			else:
				anim_player.play_backwards("SidebarAnimation")
