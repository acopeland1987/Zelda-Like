extends entity

var speed = 200

func _physics_process(delta):
	movement_loop()
	controls_loop()
	spritedir_loop()
	
	if movedir != Vector2(0,0):
		anim_switch("walk")
	else:
		anim_switch("idle")
	

func controls_loop():
	var LEFT 	= Input.is_action_pressed("ui_left")
	var RIGHT	= Input.is_action_pressed("ui_right")
	var UP		= Input.is_action_pressed("ui_up")
	var DOWN	= Input.is_action_pressed("ui_down")
	
	movedir.x = - int(LEFT) + int(RIGHT)
	movedir.y = - int(UP) + int(DOWN)
	
		
""" This next code is to replace walk_anim for 4-direction movement

func spritedir_loop():
	match movedir:
		Vector2(-1,0):
			spritedir = "left"
		Vector2(1,0):
			spritedir = "right"
		Vector2(0,-1):
			spritedir = "up"
		Vector2(0,1):
			spritedir = "down"
			
func anim_switch(animation):
	var newanim = str(animation.spritedir)
	if $anim.current_animation != newanim:
		#anim.play(newanim)
		
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
		