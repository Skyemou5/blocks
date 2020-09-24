tool
extends Node2D

export(Texture) onready var tex : Texture




func _process(_delta):
	if Engine.editor_hint:
		get_node("Sprite").texture = tex
		get_node("Sprite/Sprite").texture = tex
		get_node("Sprite/Sprite/Sprite").texture = tex


func Change_Sprite(spr,tx):
	if Engine.editor_hint:
		spr.Texture = tx
