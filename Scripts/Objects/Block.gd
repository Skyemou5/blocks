tool
extends Node2D


export(String) onready var blockType:String = "Block"
export(Texture) onready var blockSprite:Texture

onready var _get_spr_node = $KinematicBody2D/Block1

func _ready():
	if not Engine.editor_hint:
		_get_spr_node.texture = blockSprite

func _change_sprite(spr):
	if Engine.editor_hint:
		_get_spr_node.texture = spr

func _process(delta):
	_change_sprite(blockSprite)
	
