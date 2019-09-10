extends Label

var score_display = 0

func _ready():
	score_loop()
	get_node("res://Player/Player.tscn").connect("score", self, "score_loop")
	
func score_loop():
	score_display +=1
	set_text(str(score_display))	