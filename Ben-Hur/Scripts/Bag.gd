extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Menu variables
var menu_on # This variables is used to make sure bag only answers to controls when the menu is not on
var bag_on # This returns to the menu the bag has been closed

# File variables
var path
var bag # This variable is used to handle the "bag.txt" file
var items_1
var items_2

# Called when the node enters the scene tree for the first time.
func _ready():
	# Sets menu
	hide()
	menu_on = true
	bag_on = true
	# Checks if bag file exits, if not, creates file	bag = File.new()
	path = "user://Files/bag.txt"
	
	bag = File.new()
	
	items_1 = ""
	items_2 = ""
	
	if bag.file_exists(path) == true:
		bag.open(path, File.READ)
		for i in range(0, 12):
			if i <= 5:
				items_1 += bag.get_line()
				items_1 += "\n\n"
			else:
				items_2 += bag.get_line()
				items_2 += "\n\n"
		bag.close()
	else:
		bag.open(path, File.WRITE)
		for i in range(0, 12):
			bag.store_string("------\n")
			if i <= 5:
				items_1 += "------\n\n"
			else:
				items_2 += "------\n\n"
		bag.close()
	
	# Setting up sprites
	$Sprite_Line.position = Vector2(-15, -14.5)
	$Sprite_Line.scale.x = 1.3
	
	# Setting up labels
	$Label_Bag.text = "BAG"
	$Label_Bag.rect_scale = Vector2(0.18, 0.18)
	$Label_Bag.rect_position = Vector2(-3.55, -27)
	$Label_Bag.show()
	
	$Label_Items.text = items_1
	$Label_Items.rect_scale = Vector2(0.15, 0.15)
	$Label_Items.rect_position = Vector2(-23, -18)
	$Label_Items.show()
	
	$Label_Items_2.text = items_2
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
		update_bag()
		
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
			add_item("armor")
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


# Item handling function

func add_item(val):
	bag.open(path, File.READ)
	
	var text = []
	var did = false
	var line
	
	for i in range(0, 12):
		line = bag.get_line()
		if line == "------":
			if did == false:
				text.append(val)
				did = true
			else:
				text.append(line)
		else:
			text.append(line)
	
	bag.close()
	
	bag.open(path, File.WRITE)
	
	for i in range(0, 12):
		bag.store_line(text[i])
	
	bag.close()

func update_bag():
		
		items_1 = ""
		items_2 = ""
		
		bag.open(path, File.READ)
		for i in range(0, 12):
			if i <= 5:
				items_1 += bag.get_line()
				items_1 += "\n\n"
			else:
				items_2 += bag.get_line()
				items_2 += "\n\n"
		bag.close()
		
		$Label_Items.text = items_1
		$Label_Items_2.text = items_2
	
