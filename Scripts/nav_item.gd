extends Control

@export var icon : CompressedTexture2D
@export var label = "Fleet"
@export var active = false

func _ready():
	$Icon.texture = icon
	$Label.text = label
	update_elements()
	
func _on_mouse_entered():
	$Bg.color = "#383c40"

func _on_mouse_exited():
	$Bg.color = "#202325"

func set_active():
	active = true
	update_elements()
	
func deactive():
	active = false
	update_elements()
	
func update_elements():
	$Active.visible = active

func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var navitems = get_tree().get_nodes_in_group("navitem")
			for item in navitems:
				item.deactive()
			set_active()
