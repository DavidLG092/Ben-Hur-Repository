extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Sprite variables and constants
const pos1 = Vector2(-25, 5)
const pos2 = Vector2(-1.5, 5)
const pos3 = Vector2(23.5, 5)

var m_line_scale_x

# Menu variables
var bag
var map
var exit

var menu_on

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	
	# Setting up sprites
	$Sprite_Menu_Line.position = pos1
	
	$Sprite_Confirmation.hide()
	$Sprite_Confirmation_Line.hide()
		
	# Normal line scale
	m_line_scale_x = $Sprite_Menu_Line.scale.x
	
	# Setting up variables
	bag = false
	map = false
	exit = false
	
	menu_on = false
	
	# Setting up labels
	$Label_Menu.text = "MENU"
	$Label_Menu.rect_scale = Vector2(0.15, 0.15)
	$Label_Menu.rect_position = Vector2(-5, -7)
	$Label_Menu.hide()
	
	$Label_Bag.text = "BAG"
	$Label_Bag.rect_scale = Vector2(0.25, 0.25)
	$Label_Bag.rect_position = Vector2(-31, 0)
	$Label_Bag.hide()
	
	$Label_Map.text = "MAP"
	$Label_Map.rect_scale = Vector2(0.25, 0.25)
	$Label_Map.rect_position = Vector2(-7, 0)
	$Label_Map.hide()
	
	$Label_Exit.text = "EXIT"
	$Label_Exit.rect_scale = Vector2(0.25, 0.25)
	$Label_Exit.rect_position = Vector2(16, 0)
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
		
		# Shows labels
		$Label_Menu.show()
		$Label_Bag.show()
		$Label_Map.show()
		$Label_Exit.show()
		
		if bag == false and map == false and exit == false:
			if Input.is_action_just_pressed("move_left"):
				match $Sprite_Menu_Line.position:
					pos1:
						$Sprite_Menu_Line.position = pos3
						$Sprite_Menu_Line.scale.x = 1.2
					pos2:
						$Sprite_Menu_Line.position = pos1
						$Sprite_Menu_Line.scale.x = m_line_scale_x
					pos3:
						$Sprite_Menu_Line.position = pos2
						$Sprite_Menu_Line.scale.x = m_line_scale_x
			if Input.is_action_just_pressed("move_right"):
				match $Sprite_Menu_Line.position:
					pos1:
						$Sprite_Menu_Line.position = pos2
						$Sprite_Menu_Line.scale.x = m_line_scale_x
					pos2:
						$Sprite_Menu_Line.position = pos3
						$Sprite_Menu_Line.scale.x = 1.2
					pos3:
						$Sprite_Menu_Line.position = pos1
						$Sprite_Menu_Line.scale.x = m_line_scale_x
			if Input.is_action_just_pressed("attack_confirm"):
				match $Sprite_Menu_Line.position:
					pos1:
						bag = true
					pos2:
						map = true
					pos3:
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
