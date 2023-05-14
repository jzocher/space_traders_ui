extends Control

@onready var anim_player = $AnimationPlayer
var following = false
var start_pos = Vector2i()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#$MarginContainer/VBoxContainer/HBoxContainer/GreetingLabel.text += agent_info.agent_name
	#$MarginContainer/VBoxContainer/HBoxContainer/CreditsLabel.text += str(agent_info.credits)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# print(DisplayServer.window_get_position(), " ",get_local_mouse_position(), " ", start_pos)
	# print(DisplayServer.window_get_position()+Vector2i(get_local_mouse_position())-Vector2i(start_pos))
	pass

func _on_menu_toggle_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if $HBoxContainer/Sidebar.custom_minimum_size[0] == 60:
				anim_player.play("SidebarAnimation")
			else:
				anim_player.play_backwards("SidebarAnimation")


# Fix this later. Used to move the window with a built in top bar
func _on_title_bar_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			print("Clicked top bar")
			following = !following
			start_pos = get_local_mouse_position()
			
		if following:
			DisplayServer.window_set_position(DisplayServer.window_get_position()+Vector2i(get_local_mouse_position())-Vector2i(start_pos))
