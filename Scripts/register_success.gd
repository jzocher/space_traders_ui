extends Window

# Called when the node enters the scene tree for the first time.
func _ready():
	$".".add_theme_icon_override("close", Texture2D.new())
	$".".unresizable = true
	print($".".initial_position)
	# $".".position = $".".initial_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $Pad/v1/HBoxContainer/Confirm.disabled == true:
		$Pad/v1/HBoxContainer/Confirm.text = str(floor($ConfirmBtnLockout.time_left)+1)


func _on_confirm_btn_lockout_timeout():
	$Pad/v1/HBoxContainer/Confirm.disabled = false
	$Pad/v1/HBoxContainer/Confirm.text = "I have saved my access token"

func _on_visibility_changed():
	$ConfirmBtnLockout.start(5)


func _on_confirm_pressed():
	$".".queue_free()
	
