extends Control

# @onready var agent_info = get_node("/root/agent_info")
# Called when the node enters the scene tree for the first time.
func _ready():
	$ControlPanel/Choice.visible = true
	$ControlPanel/Register.visible = false
	$ControlPanel/Login.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_login_btn_pressed():
	if $Container/VBoxContainer/HBoxContainer/TokenTextbox.text != "":
		var options = ["Content-Type: application/json","Authorization: Bearer "+$Container/VBoxContainer/HBoxContainer/TokenTextbox.text]
		$HTTPRequest.request_completed.connect(_on_request_completed)
		$HTTPRequest.request("https://api.spacetraders.io/v2/my/agent", options)

func _on_request_completed(_result, _response_code, _headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json["data"]["accountId"])
#	agent_info.account_id = json["data"]["accountId"]
#	agent_info.agent_name 	= json["data"]["symbol"]
#	agent_info.headquarters = json["data"]["headquarters"]
#	agent_info.credits = json["data"]["credits"]
#	get_tree().change_scene_to_file("res://Scenes/overview.tscn")
	print("ID: ",agent_info.account_id,
		"\nNAME: ",agent_info.agent_name,
		"\nHEADQUARTERS: ",agent_info.headquarters,
		"\nCREDITS: ",agent_info.credits)


func _on_login_pressed():
	$ControlPanel/Choice.visible = false
	$ControlPanel/Register.visible = false
	$ControlPanel/Login.visible = true


func _on_register_pressed():
	$ControlPanel/Choice.visible = false
	$ControlPanel/Register.visible = true
	$ControlPanel/Login.visible = false


func _on_back_btn_pressed():
	$ControlPanel/Choice.visible = true
	$ControlPanel/Register.visible = false
	$ControlPanel/Login.visible = false
