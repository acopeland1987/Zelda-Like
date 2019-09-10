extends entity

var movetimer_length = 25
var movetimer = 0

func _init():
	SPEED = 100

func _ready():
	$anim.play("walk")
	movedir = dir.random_direction()
	
func _physics_process(delta):
	movement_loop()
	damage_loop()
	if movetimer > 0:
		movetimer -= 1
	if movetimer == 0 or is_on_wall():
		movedir = dir.random_direction()
		movetimer = movetimer_length

