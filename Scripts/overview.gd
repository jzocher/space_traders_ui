extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/HBoxContainer/GreetingLabel.text += agent_info.agent_name
	$MarginContainer/VBoxContainer/HBoxContainer/CreditsLabel.text += str(agent_info.credits)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
