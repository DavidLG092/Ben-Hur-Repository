extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Management variables

var menu_on

# Called when the node enters the scene tree for the first time.
func _ready():
	menu_on = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func manage(player, menu):
	if Input.is_action_just_pressed("interact_menu"):
			player.set_menu_on(true)
			menu.set_menu_on(true)
			menu.scale = Vector2(12, 12)
			menu.position = Vector2(512, 450)
	
	if menu.get_menu_on() == false:
		player.set_menu_on(false)
	
	if menu.get_bag() == true:
		if Input.is_action_just_pressed("interact_menu"):
			player.use_item(menu.get_item())
