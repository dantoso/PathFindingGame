extends Node2D
class_name Grid

@onready var parent: = get_parent()
@onready var screen: = get_viewport_rect()
@onready var tileModel: Tile = $Tile
@onready var line: = $Line2D

var pieceManager: = PieceManager.new()
var tiles: = {}
var callable: = Callable(self, "doNothing")


func doNothing() -> void:
	return


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("path"):
		callable = Callable(self, "startPathing")
		if !pieceManager.hasStartPiece() && !pieceManager.hasEndPiece():
			line.add_point(pieceManager.getStartTile().global_position)
			line.add_point(pieceManager.getEndTile().global_position)
			add_child(line)
		
	elif event.is_action_released("path"):
		callable = Callable(self, "doNothing")


func _ready() -> void:
	remove_child(tileModel)
	remove_child(line)
	
	var width: = screen.size.x
	var height: = screen.size.y
	
	var rows = height/tileModel.side + 1
	var columns = width/tileModel.side + 1
	
	addGrid(rows, columns)


func addGrid(rows: int, columns: int) -> void:
	print(rows, " ", columns)
	for i in rows:
		for j in columns:
#			await get_tree().create_timer(0.01).timeout
			
			var pos: = Vector2.ZERO
			pos.x = tileModel.side/2 + tileModel.side*j
			pos.y = tileModel.side/2 + tileModel.side*i
			
			var tile: = tileModel.duplicate()
			
			if tile:
				var id: = Vector2(j, i)
				tile.identifier = id
				tile.position = pos
				tile.pieceManager = pieceManager
				add_child(tile)
				tiles[id] = tile
			
		
	print(tiles.size())


func startPathing() -> bool:
	if pieceManager.hasStartPiece() || pieceManager.hasEndPiece():
		print("ERROR: cannot path without start and end pieces")
		return false
	
#	queue_redraw()
	
	var start: Tile = pieceManager.getStartTile()
	var end: Tile = pieceManager.getEndTile()
	# do pathing
	
	var spaceState = get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(
		start.global_position,
		end.global_position,
		start.collision_mask,
		[start]
	)
	
	var result = spaceState.intersect_ray(query)
	print(result)
	if !result:
		print("No walls found!")
		return true
	
	var wall: Tile = result["collider"]

	print("found wall: ", wall.identifier)
	
	
	return true


func _draw() -> void:
	if !pieceManager.hasStartPiece() && !pieceManager.hasEndPiece():
		draw_line(
			pieceManager.getStartTile().global_position,
			pieceManager.getEndTile().global_position,
			Color.WHITE,
			10.0
		)


func _physics_process(delta: float) -> void:
	callable.call()






