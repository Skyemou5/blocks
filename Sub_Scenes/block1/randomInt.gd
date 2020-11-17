extends Node

var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()
	var my_random_number = rng.randi_range(0, 4)
