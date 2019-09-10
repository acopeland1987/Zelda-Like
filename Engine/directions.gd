extends Node

const center = Vector2(0,0)
const up = Vector2(-1,0)
const down = Vector2(1,0)
const left = Vector2(0,-1)
const right = Vector2(0,1)

func random_direction():
	match(randi()%4):
		0:
			return left
		1:
			return right
		2:
			return up
		3:
			return down