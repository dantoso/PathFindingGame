extends Node
class_name PieceContainer

@onready var parent: Tile = get_parent()
var piece: Piece = null

func delete() -> void:
	if !piece:
		return
	
	parent.pieceManager.setHasStart(piece is StartPiece)
	parent.pieceManager.setHasEnd(piece is EndPiece)
	piece = null
	
	print("deleting structure in ", parent.identifier)


func addStart() -> void:
	if piece is StartPiece:
		return
	parent.pieceManager.setHasStart(false)
	piece = StartPiece.new()
	print("adding start to ", parent.identifier)


func addEnd() -> void:
	if piece is EndPiece:
		return
	parent.pieceManager.setHasEnd(false)
	piece = EndPiece.new()
	print("adding end to ", parent.identifier)


func addWall() -> void:
	if piece is WallPiece:
		return
	piece = WallPiece.new()
	print("adding wall to ", parent.identifier)
