tool
extends Node2D

########################## exported vars ##########################

export(bool) onready var visualize_grid: bool = true

onready var grid = get_parent()

##### ================================================== #####

########################## private vars ##########################

var font

##### ================================================== #####

func _ready():
	
	#print(transform)
	
	if Engine.editor_hint:
		modulate = Color( 1, 0.2, 0, 0.2 )
		
		###### ---- font ---- ######
		font = DynamicFont.new()
		font.font_data = load("res://Assets/UI/fonts/toolfontData.tres")
		font.size = 10

func _draw():

	#if Engine.editor_hint:
		### text ###
	draw_lines()
	draw_cells()


func draw_lines():
		#### LINES ####
	
	var LINE_COLOR = Color(255, 255, 255)
	var LINE_WIDTH = 1
	#	var window_size = OS.get_window_size()

	for x in range(grid.cell_quadrant_size + 1):
		#print(x)
		var col_pos = x * grid.cell_size.x
		var limit = grid.grid_size.y * grid.cell_size.y
		draw_line(Vector2(col_pos, 0), Vector2(col_pos, limit), LINE_COLOR, LINE_WIDTH)
	for y in range(grid.cell_quadrant_size + 1):
		#print(y)
		var row_pos = y * grid.cell_size.y
		var limit = grid.grid_size.x * grid.cell_size.x
		draw_line(Vector2(0, row_pos), Vector2(limit, row_pos), LINE_COLOR, LINE_WIDTH)


func draw_cells():
	var cell_col = Color(255,0,0)
#	var BOX_SIZE = grid.cell_size
#	print(BOX_SIZE)
#	for cell in range(grid.grid_size):
#		print(cell)
	var box_position: Vector2 = grid.cell_size
	
	#print_debug('box pos ' + str(box_position))
	
	var cell_num = 0
	var col_num = 0
	var row_num = 0
	var pos: Vector2
	
	for i in range(grid.cell_quadrant_size):
		#print(i)
		cell_num += i
		row_num += i
		pos = Vector2(i * grid.tile_size.x + grid.half_tile_size.x, grid.half_tile_size.y )
		pos = pos + grid.transform.origin
		draw_circle(pos,grid.half_tile_size.x - 1,cell_col)
		#print(i)
		#print(pos)
		
		for j in range(grid.cell_quadrant_size ):
			#print(j + i)
			cell_num += j
			col_num += j
			#print(j)
			var row_pos = j * grid.tile_size.y + grid.half_tile_size.y
			pos = Vector2(i * grid.tile_size.x + grid.half_tile_size.x, j * grid.tile_size.y + grid.half_tile_size.y )
			#print(pos)
			draw_circle(pos,grid.half_tile_size.x - 1,cell_col)
	
	#print(grid.grid)
	#print('row '+ str(row_num))
	#print('total '+ str(cell_num))
	#print('position '+ str(cell_num))
	
