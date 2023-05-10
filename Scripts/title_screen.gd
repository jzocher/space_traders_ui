extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_login_btn_pressed():
	if $Container/VBoxContainer/HBoxContainer/TokenTextbox.text != "":
		var options = ["Content-Type: application/json","Authorization: Bearer "+$Container/VBoxContainer/HBoxContainer/TokenTextbox.text]
		$HTTPRequest.request_completed.connect(_on_request_completed)
		$HTTPRequest.request("https://api.spacetraders.io/v2/my/agent", options)

func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)
