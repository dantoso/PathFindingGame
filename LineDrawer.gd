extends Node2D
class_name LineDrawer

var points: Array[Vector2] = []

func _draw() -> void:
	for i in points.size():
		if i+1 == points.size():
			break
		
		var start: = points[i]
		var end: = points[i+1]
		draw_line(start, end, Color.WHITE, 10.0)
