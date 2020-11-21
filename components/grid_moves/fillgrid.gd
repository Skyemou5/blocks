
extends GridContainer

################### VARS ###################

#onready var _get_node = $GridContainer.columns

#export var cols: int = 5 setget setcols
onready var columns_num: int = 5
export onready var string_load: String = "res://components/grid_moves/panel_click.tscn"
onready var move_btn# = load(string_load)

var matrix=[]

############### SETUP ###############

func _ready():
	move_btn = preload("res://components/grid_moves/panel_click.tscn")
	print(move_btn)
	#fill_grid(columns_num,add_as_child(create_instance(move_btn)))
	#if Engine.editor_hint:
	#fill_grid(columns_num,create_instance(move_btn))

################ WORK ################
func _process(delta):
	pass
	#fill_grid(columns_num,create_instance(move_btn))

	# for x in range(width):
	# 	matrix.append([])
	# 	for y in range(height):
	# 		matrix[x].append(0)


################ METHODS ################
func fill_grid(amt,action):
	var grid_num = amt * amt
	for i in range(grid_num):
		action
		if i == grid_num:
			break
		print(i)

func create_instance(ref):
	var scene = ref
	var scene_instance = scene.instance()
	print(scene_instance)
	add_child(scene_instance)

func add_as_child(child):
	add_child(child)
	#get_tree().current_scene.add_child(child)
	
############# GETSET ##############
# func setcols(value):
# 	cols = value
