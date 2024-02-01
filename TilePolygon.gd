extends Polygon2D
class_name TilePolygon

@onready var parent: Tile = get_parent()
var callable: = Callable(self, "doNothing")

func _draw() -> void:
	draw_rect(parent.shape.get_rect(), color, true)


func deactivate() -> void:
	color.a = 0
	callable = Callable(self, "doNothing")
	


func activate() -> void:
	color.a = 0.5
	callable = Callable(self, "handleInput")


func doNothing(event: InputEvent) -> void:
	pass


func handleInput(event: InputEvent) -> void:
	if event.is_action_pressed("add_start"):
		print("adding start to ", parent.identifier)
	elif event.is_action_pressed("add_end"):
		print("adding end to ", parent.identifier)
	elif event.is_action("add_wall"):
		print("adding wall to ", parent.identifier)


func _unhandled_input(event: InputEvent) -> void:
	callable.call(event)



