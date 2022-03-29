extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Movement variables
var screen_size

var speed

var d_free
var u_free
var l_free
var r_free

# Animation variables
var dir

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
	speed = 400
	
	d_free = true
	u_free = true
	l_free = true
	r_free = true
	
	dir = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_down"):
		if d_free == true:
			velocity.y += 1
		dir = 0
	if Input.is_action_pressed("move_up"):
		if u_free == true:
			velocity.y -= 1
		dir = 1
	if Input.is_action_pressed("move_left"):
		if l_free == true:
			velocity.x -= 1
		dir = 2
	if Input.is_action_pressed("move_right"):
		if r_free == true:
			velocity.x += 1
		dir = 3
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		$AnimatedSprite.frame = 0
	
	position += velocity * delta
	position.x = clamp(position.x, 40, screen_size.x - 40)
	position.y = clamp(position.y, 96, screen_size.y - 96)
	
	set_anim(dir)

func start(pos):
	position = pos
	show()
	$Down_CollisionShape2D.disabled = false
	$Up_CollisionShape2D.disabled = false
	$Left_CollisionShape2D.disabled = false
	$Right_CollisionShape2D.disabled = false

func set_anim(direc):
	match direc:
		0:
			$AnimatedSprite.animation = "move_down"
		1:
			$AnimatedSprite.animation = "move_up"
		2:
			$AnimatedSprite.animation = "move_left"
		3:
			$AnimatedSprite.animation = "move_right"


func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	var shape = self.shape_owner_get_owner(local_shape_index)
	
	if shape == $Down_CollisionShape2D:
		d_free = false
	if shape == $Up_CollisionShape2D:
		u_free = false
	if shape == $Left_CollisionShape2D:
		l_free = false
	if shape == $Right_CollisionShape2D:
		r_free = false

func _on_Area2D_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	var shape = self.shape_owner_get_owner(local_shape_index)
	
	if shape == $Down_CollisionShape2D:
		d_free = true
	if shape == $Up_CollisionShape2D:
		u_free = true
	if shape == $Left_CollisionShape2D:
		l_free = true
	if shape == $Right_CollisionShape2D:
		r_free = true