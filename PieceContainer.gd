extends Node
class_name PieceContainer

@onready var parent: Tile = get_parent()
var piece: Piece = null

func delete() -> void:
	if !piece:
		return
	
	PieceManager.main.setHasStart(piece is StartPiece)
	PieceManager.main.setHasEnd(piece is EndPiece)
	piece = null
	
	print("deleting structure in ", parent.identifier)


func addStart() -> void:
	if piece is StartPiece:
		return
	print("adding start to ", parent.identifier)


func addEnd() -> void:
	if piece is EndPiece:
		return
	print("adding end to ", parent.identifier)


func addWall() -> void:
	if piece is WallPiece:
		return
	print("adding wall to ", parent.identifier)
