extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Menu variables
var menu_on # This variables is used to make sure bag only answers to controls when the menu is not on
var bag_on # This returns to the menu the bag has been closed

# File variables
var bag # This variable is used to handle the "bag.txt" file

# Called when the node enters the scene tree for the first time.
func _ready():
	# Sets menu
	hide()
	menu_on = true
	bag_on = true
	
	# Checks if bag file exits, if not, creates file	bag = File.new()
	bag = File.new()
	
	if bag.file_exists("user://Desktop//bag.txt") == true:
		bag.open("C://Users//dgomes//Desktop//bag.txt", File.READ)
		bag.close()
	else:
		bag.open("C://Users//dgomes//Desktop//bag.txt", File.WRITE)
		bag.close()
	
	# Setting up sprites
	$Sprite_Line.position = Vector2(-15, -14.5)
	$Sprite_Line.scale.x = 1.3
	
	# Setting up labels
	$Label_Bag.text = "BAG"
	$Label_Bag.rect_scale = Vector2(0.18, 0.18)
	$Label_Bag.rect_position = Vector2(-3.55, -27)
	$Label_Bag.show()
	
	$Label_Items.text = "asaasa\n\nasaasa\n\nasaasa\n\nasaasa\n\nasaasa\n\nasaasa"
	$Label_Items.rect_scale = Vector2(0.15, 0.15)
	$Label_Items.rect_position = Vector2(-23, -18)
	$Label_Items.show()
	
	$Label_Items_2.text = "asaasa\n\nasaasa\n\nasaasa\n\nasaasa\n\nasaasa\n\nasaasa"
	$Label_Items_2.rect_scale = Vector2(0.15, 0.15)
	$Label_Items_2.rect_position = Vector2(7.35, -18)
	$Label_Items_2.show()
	
	$Label_Controls.text = "KEYS - MOVE  Z - USE ITEM\nX - DELETE ITEM  C - GO BACK"
	$Label_Controls.rect_scale = Vector2(0.11, 0.11)
	$Label_Controls.rect_position = Vector2(-24, 21)
	$Label_Controls.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bag_on = true
	
	# Controls line movement
	if menu_on == false:
		
		show()
		
		if Input.is_action_just_pressed("move_down"):
			if $Sprite_Line.position.y + 6 < 16.5:
				$Sprite_Line.position.y += 6
		if Input.is_action_just_pressed("move_up"):
			if $Sprite_Line.position.y - 6 >= -14.5:
				$Sprite_Line.position.y -= 6
		if Input.is_action_just_pressed("move_left"):
			$Sprite_Line.position.x = -15
		if Input.is_action_just_pressed("move_right"):
			$Sprite_Line.position.x = 15
		
		# Controls items and menu
		if Input.is_action_just_pressed("interact_menu"):
			pass
		if Input.is_action_just_pressed("attack_confirm"):
			pass
		if Input.is_action_pressed("spare_reject"):
			bag_on = false
			menu_on = true
			$Sprite_Line.position = Vector2(-15, -14.5)
			
	else:
		hide()


func set_menu_on(val):
	menu_on = val

func get_menu_on():
	return menu_on


func get_bag_on():
	return bag_on
