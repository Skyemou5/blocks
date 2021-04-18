extends Node2D


var matrix=[]
export onready var width: int = 5
export onready var height: int = 5
var amt: int = 5
var grid: Array2D = Array2D.new()
var g2 = grid.data
var grid2 = []


func _ready():
	for x in width:
		grid2.append([x])

	print(grid2)
