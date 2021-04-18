extends Node2D

var ar2d = preload("res://Scripts/classes/Array2D.gd").new()
#var ar2d: Array2D
var grid=[]
var grid2=[]
var dic = {}
########### exports ################
export(int) var width: int = 5
export(int) var height: int = 5
export(int) var cell_quadrant_size: int = 16
export(int) var tile_size_pixels: int = 16
export(int) var rows: int = 20
export(int) var columns: int = 10
####################################
var cell_size = Vector2(tile_size_pixels, tile_size_pixels)
var grid_size = Vector2(rows,columns)
var tile_size: Vector2 = Vector2(tile_size_pixels,tile_size_pixels)
var half_tile_size = tile_size/2
var myfnt
#var font: Font = preload("res://Assets/UI/fonts/main_dynamic_font_data.tres")
############
onready var debugger = $Debug

# var file = File.new()
# file.open("user://grid.json", File.WRITE)
# file.store_string(json_text)
# file.close()

func _ready():
	ar2d._init()
	ar2d.fill(10)
	# print(ar2d.size())
	# #grid2 = get_world_2d()
	# print(grid2)
	# print(tile_size)
	# print(half_tile_size)
	create_grid(grid,grid_size,cell_size)
	#print(grid)

func mkfont(fsize):
	var fnt = DynamicFont.new()
	fnt.size = fsize
	fnt.set_font_data(load("res://Assets/UI/fonts/toolfontData.tres"))
	return fnt

func create_grid(baseObj,grid_size:Vector2 = Vector2(10,10),cell_size:Vector2=Vector2(16,16)):
	var pos: Vector2
	var center: Vector2
	var id: int = 0
	for x in range(grid_size.x):
		baseObj.append([])
		for y in range(grid_size.y):
			id = id+1
			pos = Vector2(cell_size.x+x*cell_size.x-cell_size.x, cell_size.y+y*cell_size.y-cell_size.y)
			center = Vector2(cell_size.x+x*cell_size.x-cell_size.x+half_tile_size.x, cell_size.y+y*cell_size.y-cell_size.y+half_tile_size.y)

			grid[x].append([{"id":id,"pos":pos,"center":center,"cell_size":grid_size}])
	#return grid

func draw_grid(griddata):
	var label = Label.new()
	#var font = label.get_font("")
	#font.size = 10
	myfnt = mkfont(3)
	var labelstring: String

	var style_box = StyleBoxFlat.new()
	for row in range(rows):
		for cell in griddata[row]:
			for i in cell:
				print(i)
				labelstring = i.id as String
				#print(cell[0].pos)
				draw_style_box(style_box,Rect2(i.pos,cell_size-Vector2(1,1)))
				draw_string(myfnt,i.center,labelstring,Color.aliceblue)

func _draw():
	draw_grid(grid)	
		
func debug_draw():
	var label = Label.new()
	var font = label.get_font("")
	var labelstring: String
	var i: int = 0
	var pos = Vector2.ZERO
	var style_box = StyleBoxFlat.new()
	for x in range(grid_size.x):
		
		for y in range(grid_size.y):
			
			labelstring = i as String
			pos = Vector2(cell_size.x+x*cell_size.x-cell_size.x, cell_size.y+y*cell_size.y-cell_size.y)
			#print(pos)
			var size = Vector2(cell_size.x-1,cell_size.y-1)
			draw_style_box(style_box,Rect2(pos,size))
			draw_string(font,pos,labelstring,Color.aliceblue)


