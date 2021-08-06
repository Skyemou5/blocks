extends Node2D

onready var basetile: TileMap = $basegrid
export(Vector2) var map_size: Vector2 = Vector2(20,10)
export var map_cap = 0.5
var noise

func _ready():
	noise = OpenSimplexNoise.new()
	noise.seed = randi()
	noise.octaves = 1.0
	noise.period = 1
	make_map()


func make_map():
	for x in map_size.x:
		for y in map_size.y:
			var a = noise.get_noise_2d(x,y)
			if a < map_cap:
				basetile.set_cell(x,y,0)
	basetile.update_bitmask_region(Vector2(0.0,0.0),Vector2(map_size.x,map_size.y))
