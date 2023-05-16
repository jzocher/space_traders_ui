extends Control

# @onready var agent_info = get_node("/root/agent_info")
# Called when the node enters the scene tree for the first time.
func _ready():
	$ControlPanel/ChoiceMenu.visible = true
	$ControlPanel/RegisterMenu.visible = false
	$ControlPanel/LoginMenu.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_login_btn_pressed():
	var agent_token = $ControlPanel/LoginMenu/MarginContainer/VBoxContainer/HBoxContainer/TokenTextbox.text
	if agent_token != "":
		print(agent_token)
		var options = ["Content-Type: application/json","Authorization: Bearer "+agent_token]
		$HTTPRequest.request_completed.connect(_on_login_request_completed)
		$HTTPRequest.request("https://api.spacetraders.io/v2/my/agent", options)

func _on_login_request_completed(result, response_code, _headers, body):
	if result == $HTTPRequest.RESULT_SUCCESS:
		var json = JSON.parse_string(body.get_string_from_utf8())
		print("Success:\n",json,"\n",result,"\n", response_code)
		agent_info.account_id = json["data"]["accountId"]
		agent_info.agent_name 	= json["data"]["symbol"]
		agent_info.headquarters = json["data"]["headquarters"]
		agent_info.credits = json["data"]["credits"]
		get_tree().change_scene_to_file("res://Scenes/overview.tscn")
	else:
		print("Error:\n",result, response_code)


func _on_register_btn_pressed():
	var reg_username = $ControlPanel/RegisterMenu/MarginContainer/Control/VBoxContainer/HBoxContainer/VBoxContainer2/AgentSymbolText.text.to_upper()
	var reg_faction = $ControlPanel/RegisterMenu/MarginContainer/Control/VBoxContainer/HBoxContainer/VBoxContainer2/FactionText.text.to_upper()
	if reg_username != "" and reg_faction != "":
		var url = "https://api.spacetraders.io/v2/register"
		var headers = ["Content-Type: application/json"]
		var body = JSON.stringify({"symbol":reg_username,"faction":reg_faction})
		$HTTPRequest.request_completed.connect(_on_register_request_completed)
		$HTTPRequest.request(url, headers, true, HTTPClient.METHOD_POST, body)
		
		
func _on_register_request_completed(result, response_code, _headers, body):
	if result == $HTTPRequest.RESULT_SUCCESS:
		var json = JSON.parse_string(body.get_string_from_utf8())
		print(json)
	else:
		print("Error:\n","result: ", result, "\nresponse: ", response_code)

func _on_register_choice_pressed():
	$ControlPanel/ChoiceMenu.visible = false
	$ControlPanel/RegisterMenu.visible = true
	$ControlPanel/LoginMenu.visible = false


func _on_login_choice_pressed():
	$ControlPanel/ChoiceMenu.visible = false
	$ControlPanel/RegisterMenu.visible = false
	$ControlPanel/LoginMenu.visible = true


func _on_back_btn_pressed():
	$ControlPanel/ChoiceMenu.visible = true
	$ControlPanel/RegisterMenu.visible = false
	$ControlPanel/LoginMenu.visible = false

