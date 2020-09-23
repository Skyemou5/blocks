tool
extends Node2D


export(String) onready var blockType:String = "Block"
export(Texture) onready var blockSprite:Texture

onready var _get_spr_node = $Sprite 
func _change_sprite(sprite):
	if Engine.editor_hint:
		_get_spr_node.texture = sprite

func _process(delta):
	_change_sprite(blockSprite)
