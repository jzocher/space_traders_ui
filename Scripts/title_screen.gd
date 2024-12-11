extends Control

@onready var req = $HTTPRequest  
# @onready var agent_info = get_node("/root/agent_info")
# Called when the node enters the scene tree for the first time.
func _ready():
	$ControlPanel/ChoiceMenu.visible = true
	$ControlPanel/RegisterMenu.visible = false
	$ControlPanel/LoginMenu.visible = false
	
	req.request_completed.connect(_on_version_request_completed)
	var error = req.request("https://api.spacetraders.io/v2")
	if error != OK:
		print("Failed to send request.")
	else:
		print("Request sent successfully.")
	

func _on_version_request_completed(result, response_code, _headers, body):
	if response_code == 200:
		var json = JSON.parse_string(body.get_string_from_utf8())
		$Version.text = ("Version: " + json["version"])
		$LastReset.text = ("Last Reset: " + json["resetDate"])
	else:
		print("Failed to fetch game data")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_login_btn_pressed():
	var agent_token = $ControlPanel/LoginMenu/MarginContainer/VBoxContainer/HBoxContainer/TokenTextbox.text
	if agent_token != "":
		print(agent_token)
		var options = ["Content-Type: application/json","Authorization: Bearer "+agent_token]
		req.request_completed.connect(_on_login_request_completed)
		req.request("https://api.spacetraders.io/v2/my/agent", options)

func _on_login_request_completed(result, response_code, _headers, body):
	print("result: ",result, "response_code: ", response_code)
	if result == req.RESULT_SUCCESS and response_code == 200:
		var json = JSON.parse_string(body.get_string_from_utf8())
		print("Success:\n",json,"\n",result,"\n", response_code)
		agent_info.account_id = json["data"]["accountId"]
		agent_info.agent_name 	= json["data"]["symbol"]
		agent_info.headquarters = json["data"]["headquarters"]
		agent_info.credits = json["data"]["credits"]
		get_tree().change_scene_to_file("res://Scenes/overview.tscn")
	elif response_code == 401:
		print("No trader found")
	else:
		print("Unknown: ", result, " ", response_code)


func _on_register_btn_pressed():
	var reg_username = $ControlPanel/RegisterMenu/MarginContainer/Control/VBoxContainer/HBoxContainer/VBoxContainer2/AgentSymbolText.text.to_upper()
	var reg_faction = $ControlPanel/RegisterMenu/MarginContainer/Control/VBoxContainer/HBoxContainer/VBoxContainer2/FactionText.text.to_upper()
	if reg_username != "" and reg_faction != "":
		var url = "https://api.spacetraders.io/v2/register"
		var headers = ["Content-Type: application/json"]
		var body = JSON.stringify({"symbol":reg_username,"faction":reg_faction})
		req.request_completed.connect(_on_register_request_completed)
		req.request(url, headers, HTTPClient.METHOD_POST, body)
		
		
func _on_register_request_completed(result, response_code, _headers, body):
	if result == req.RESULT_SUCCESS:
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


func _on_factions_info_toggled(toggled_on):
	$ControlPanel/RegisterMenu/Factions.visible = true


func _on_factions_info_pressed():
	$ControlPanel/RegisterMenu/Factions.visible = !$ControlPanel/RegisterMenu/Factions.visible
