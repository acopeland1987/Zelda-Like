class_name entity
extends KinematicBody2D

var SPEED = 200
var movedir = Vector2(0,0)
var spritedir = "down"

func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0)) 

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
	var newanim = "%s%s" % [animation, spritedir]
	if $anim.current_animation != newanim:
		$anim.play(newanim)
		

"""
test this code for pushing:
if movedir != Vector2(0, 0):
   if is_on_wall():
      animation_switch("push")
   else:
      animation_switch("walk")
else:
   animation_switch("idle")
"""