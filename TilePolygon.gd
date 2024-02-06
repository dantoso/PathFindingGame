extends Polygon2D
class_name TilePolygon

@onready var parent: Tile = get_parent()
var callable: = Callable(self, "doNothing")
var standardColor: Color = color

func _draw() -> void:
	draw_rect(parent.shape.get_rect(), color, true)


func deselectedState() -> void:
	color.a = 1
	callable = Callable(self, "doNothing")


func selectedState() -> void:
	color.a = 0
	callable = Callable(self, "handleInput")


func doNothing(_event: InputEvent) -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	callable.call(event)


func handleInput(event: InputEvent) -> void:
	if event.is_action_pressed("add_start"):
		parent.pieceContainer.addStart()
	elif event.is_action_pressed("add_end"):
		parent.pieceContainer.addEnd()
	elif event.is_action("add_wall"):
		parent.pieceContainer.addWall()
	elif event.is_action("delete"):
		parent.pieceContainer.delete()











