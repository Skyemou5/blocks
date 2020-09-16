tool
extends Node2D

export(String) var blockType:String = "Block"
export(Texture) var blockSprite:Texture


func _change_sprite(sprite):
	#if Engine.editor_hint:
	pass
	
func _process(delta):
	if Engine.editor_hint:
		getallnodes()
	pass

func _loop_through_children(name):

	pass

func getallnodes(node):
	for N in node.get_children():
		if N.get_child_count() > 0:
			print("["+N.get_name()+"]")
			getallnodes(N)
		else:
			# Do something
			print("- "+N.get_name())
