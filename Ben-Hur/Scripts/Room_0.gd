extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Scripts
const mgm = preload("res://Scripts/ManageMenu.gd")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var menu = mgm.new()
	
	menu.manage($Player, $Menu)
