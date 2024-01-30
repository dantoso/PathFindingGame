extends Polygon2D
class_name TilePolygon

@onready var parent: Tile = get_parent()

func _draw() -> void:
	draw_rect(parent.shape.get_rect(), color, true)
