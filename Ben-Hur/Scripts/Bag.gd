extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# File variables
var bag


# Called when the node enters the scene tree for the first time.
func _ready():
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
	$Sprite_Line.scale.x = 1.5
	
	# Setting up labels
	$Label_Bag.text = "BAG"
	$Label_Bag.rect_scale = Vector2(0.18, 0.18)
	$Label_Bag.rect_position = Vector2(-3.55, -27)
	$Label_Bag.show()
	
	$Label_Items.text = "asaasa\n\nasaasa\n\nasaasa\n\nasaasa\n\nasaasa\n\nasaasa"
	$Label_Items.rect_scale = Vector2(0.15, 0.15)
	$Label_Items.rect_position = Vector2(-25, -18)
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
	if Input.is_action_just_pressed("move_down"):
		$Sprite_Line.position.y += 6
	if Input.is_action_just_pressed("move_up"):
		$Sprite_Line.position.y -= 6
	if Input.is_action_just_pressed("move_left"):
		$Sprite_Line.position.x = -15
	if Input.is_action_just_pressed("move_right"):
		$Sprite_Line.position.x = 15
