extends Node
class_name PieceContainer

@onready var parent: Tile = get_parent()
var piece: Piece = null:
	set(new_value):
		piece = new_value
		if new_value:
			parent.polygon.color = piece.color
			parent.collision_layer = new_value.collisionLayer
			parent.collision_mask = new_value.collisionMask
		else:
			parent.polygon.color = parent.polygon.standardColor
			parent.collision_layer = 1
			parent.collision_mask = 0

func delete() -> void:
	if !piece:
		return
	
	parent.pieceManager.deletePiece(piece)
	piece = null
	
	print("deleting structure in ", parent.identifier)


func addStart() -> void:
	if piece is StartPiece:
		return
	
	delete()
	piece = parent.pieceManager.setStartTo(self)
	print("adding start to ", parent.identifier)


func addEnd() -> void:
	if piece is EndPiece:
		return
	
	delete()
	piece = parent.pieceManager.setEndTo(self)
	print("adding end to ", parent.identifier)


func addWall() -> void:
	if piece is WallPiece:
		return
	
	delete()
	piece = WallPiece.new()
	print("adding wall to ", parent.identifier)
