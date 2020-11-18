extends GridContainer

################### VARS ###################

#onready var _get_node = $GridContainer.columns

export var cols: int = 5 setget setcols

var matrix=[]

############### SETUP ###############
func _ready():
	pass

################ WORK ################
func _process(delta):
	fill_grid(5)

	for x in range(width):
		matrix.append([])
		for y in range(height):
			matrix[x].append(0)


################ METHODS ################
func fill_grid(amt):
	var grid_num = amt * amt
	for i in range(0,grid_num):
		if i == grid_num:
			break
		print(i)

func instance_item(ref):
	var obj = load(ref)
	var bullet = obj.instance()
	bullet.add_child_below_node(get_tree().get_)


############# GETSET ##############
func setcols(value):
	cols = value
