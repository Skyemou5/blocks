tool
extends Node2D

####################### Public vars #######################
export(bool) onready var editor = false
#### change sprite vars --- export to editor ####
export(String) onready var blockType:String = "Block" 
export(Texture) onready var blockSprite:Texture 
export(int, 1, 4) onready var hframes_num : int = 4 #setget changeframenum
export(int, 0, 3) onready var frame_num : int = 0 #setget startframe

onready var _get_spr_node = $KinematicBody2D/Main_spr

onready var _anim_tree = $KinematicBody2D/AnimationTree


#### end of change sprite tools ####



####################### Private vars #######################

var target = null
var velocity = Vector2.ZERO

var facing = 'right'
var can_move = true
var moves = {
	'right': Vector2(1,0),
	'left': Vector2(-1,0),
	'up': Vector2(0,-1),
	'down': Vector2(0,1)
}

var raycasts = {
	'right': 'rayDown',
	'left': 'rayLeft',
	'up': 'rayUp',
	'down': 'rayDown'
}


####################### SETUP #######################

func _ready():

	## update when the game starts
	if not Engine.editor_hint:
		_get_spr_node.texture = blockSprite
		_get_spr_node.hframes = hframes_num
		_get_spr_node.frame = frame_num
		_anim_tree.active = true

####################### WORK #######################

func _process(_delta):
	_change_sprite(blockSprite) #### in editor tool ####

####################### METHODS #######################
func checkCol(dir):
	facing = dir
	if get_node(raycasts[facing]).is_colliding():
		return
	can_move = false

# func move(dir):
# 	facing = dir
# 	$MoveTween.interpolate_property(self, 'position', position,
# 									position + moves[facing] * tile_size, 0.8,
# 									Tween.TRANS_SINE, Tween.EASE_IN_OUT)
# 	$MoveTween.start()
# 	return true



func changeframenum(val):
	hframes_num = val
	set("hframes", val)

func startframe(val):
	frame_num = val
	set('frame_num', val)

func _change_sprite(spr):
	#editor tool
	if Engine.editor_hint:
		_get_spr_node.hframes = hframes_num
		_get_spr_node.frame = frame_num
		_get_spr_node.texture = spr

# func _move(delta):
# 	if target:
		

####################### SIGNALS #######################

func _on_MoveTween_tween_completed(object, key):
	can_move = true
