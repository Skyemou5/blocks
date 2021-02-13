extends TileMap

export(bool) onready var visualize = false

enum {EMPTY, PLAYER, OBSTACLE, COLLECTIBLE}

var tile_size = get_cell_size()
var half_tile_size = tile_size / 2
var grid_size = Vector2(cell_quadrant_size, cell_quadrant_size)

var grid = []

func _ready():
	for x in range(grid_size.x):
			grid.append([])
			for y in range(grid_size.y):
				grid[x].append(EMPTY)

