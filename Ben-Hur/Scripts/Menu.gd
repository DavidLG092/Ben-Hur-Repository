extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Menu variables
var bag
var map
var exit

var menu_on

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	
	$AnimatedSprite.animation = "menu"
	$AnimatedSprite.frame = 0
	
	bag = false
	map = false
	exit = false
	
	menu_on = false
	
	$Label_Menu.text = "MENU"
	$Label_Menu.size_flags_horizontal = 1
	$Label_Menu.size_flags_vertical = 1
	$Label_Menu.show()
	$Label_Bag.text = "BAG"
	$Label_Bag.hide()
	$Label_Map.text = "MAP"
	$Label_Map.hide()
	$Label_Exit.text = "EXIT"
	$Label_Exit.hide()
	
	$Label_Sure.text = "ARE YOU SURE?"
	$Label_Sure.hide()
	$Label_Yes.text = "YES"
	$Label_Yes.hide()
	$Label_No.text = "NO"
	$Label_No.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if menu_on == true:
		show()
		if bag == false and map == false and exit == false:
			if Input.is_action_just_pressed("move_left"):
				if $AnimatedSprite.frame == 0:
					$AnimatedSprite.frame = 2
				elif $AnimatedSprite.frame == 1:
					$AnimatedSprite.frame = 0
				else:
					$AnimatedSprite.frame = 1
			if Input.is_action_just_pressed("move_right"):
				if $AnimatedSprite.frame == 0:
					$AnimatedSprite.frame = 1
				elif $AnimatedSprite.frame == 1:
					$AnimatedSprite.frame = 2
				else:
					$AnimatedSprite.frame = 0
			if Input.is_action_just_pressed("attack_confirm"):
				match $AnimatedSprite.frame:
					0:
						bag = true
					1:
						map = true
					2:
						exit = true
			if Input.is_action_just_pressed("spare_reject"):
				menu_on = false
		elif bag == true:
			$Bag.show()
		elif map == true:
			$Map.show()
		elif exit == true:
			$AnimatedSprite.animation = "confirmation"
			if Input.is_action_just_pressed("move_left"):
				if $AnimatedSprite.frame == 0:
					$AnimatedSprite.frame = 1
				else:
					$AnimatedSprite.frame = 0
			if Input.is_action_just_pressed("move_right"):
				if $AnimatedSprite.frame == 1:
					$AnimatedSprite.frame = 0
				else:
					$AnimatedSprite.frame = 1
			if Input.is_action_just_pressed("attack_confirm"):
				match $AnimatedSprite.frame:
					0:
						$AnimatedSprite.animation = "menu"
						exit = false
					1:
						pass
			if Input.is_action_just_pressed("spare_reject"):
				$AnimatedSprite.animation = "menu"
				exit = false
	else:
		hide()

func set_menu_on(val):
	menu_on = val

func get_menu_on():
	return menu_on
