extends Control

const COLUMNS = 4
const ROWS = 4

func _draw():

	var style_box = StyleBoxFlat.new()
	for x in range(COLUMNS):
		for y in range(ROWS):
			var position = Vector2(16+x*16, 16+y*16)
			var size = Vector2(16, 16)
			draw_style_box(style_box, Rect2(position, size))
