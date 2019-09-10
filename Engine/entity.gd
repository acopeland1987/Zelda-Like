class_name entity
extends KinematicBody2D

var movedir = Vector2(0,0)
var knockdir = Vector2(0,0)
var spritedir = "down"
var hitstun = 0
var score = 0

var TYPE = "ENEMY"
var SPEED = 200
var DAMAGE = 1
var HEALTH = 1


func movement_loop():
    var motion
    if hitstun > 0:
        motion = knockdir.normalized() * SPEED * 2 
    else:
        motion = movedir.normalized() * SPEED
    move_and_slide(motion, Vector2.ZERO)

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
		
func damage_loop():
	if hitstun > 0:
		hitstun -= 1
	for body in $hitbox.get_overlapping_bodies():
		if hitstun == 0 and body.get("DAMAGE") !=  null and body.get("TYPE") != TYPE:
			HEALTH -= body.get("DAMAGE")
			hitstun = 10
			knockdir = transform.origin - body.transform.origin
			

func use_item(item):
	var newitem = item.instance()
	newitem.add_to_group(str(newitem.get_name(), self))
	add_child(newitem)
	if get_tree().get_nodes_in_group(str(newitem.get_name(), self)).size() > newitem.maxamount:
		newitem.queue_free()


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