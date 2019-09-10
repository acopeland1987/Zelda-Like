extends entity

func _init():
	TYPE = "PLAYER"
	SPEED = 200
	DAMAGE = 0

var state = "default"

	
func _physics_process(delta):
	match state:
		"default":
			state_default()
		"swing":
			state_swing()
	
func state_default():
	movement_loop()
	controls_loop()
	spritedir_loop()
	damage_loop()
	
	if movedir != Vector2(0,0):
		anim_switch("walk")
	else:
		anim_switch("idle")
		
	if Input.is_action_just_pressed("use_item"):
		use_item(preload("res://Items/sword.tscn"))

func state_swing():
	anim_switch("idle")
	damage_loop()

func controls_loop():
	var LEFT 	= Input.is_action_pressed("ui_left")
	var RIGHT	= Input.is_action_pressed("ui_right")
	var UP		= Input.is_action_pressed("ui_up")
	var DOWN	= Input.is_action_pressed("ui_down")
	
	movedir.x = - int(LEFT) + int(RIGHT)
	movedir.y = - int(UP) + int(DOWN)

"""

in physics function, add:

if movedir != Vector2(0,0):
	anim_switch("walk")
else:
	anim_switch("idle")
	
test this code for pushing:
if movedir != Vector2(0, 0):
   if is_on_wall():
      animation_switch("push")
   else:
      animation_switch("walk")
else:
   animation_switch("idle")
"""
		