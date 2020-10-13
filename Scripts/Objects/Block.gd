tool
extends Node2D


export(String) onready var blockType:String = "Block"
export(Texture) onready var blockSprite:Texture
export(int, 1, 4) onready var hframes_num : int = 4
export(int, 0, 3) onready var frame_num : int = 0

onready var _get_spr_node = $KinematicBody2D/Main_spr

onready var _anim_tree = $KinematicBody2D/AnimationTree

func _ready():
	#update when the game starts
	if not Engine.editor_hint:
		_get_spr_node.texture = blockSprite
		_get_spr_node.hframes = hframes_num
		_get_spr_node.frame = frame_num
		_anim_tree.active = true

func _change_sprite(spr):
	#editor tool
	if Engine.editor_hint:
		_get_spr_node.hframes = hframes_num
		_get_spr_node.frame = frame_num
		_get_spr_node.texture = spr

func _process(_delta):
	_change_sprite(blockSprite)
	
