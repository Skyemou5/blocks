tool
extends Node

class_name math_tool

export(float) onready var input : float
export(Array) onready var numArr : Array = []


func addVal(one: float,two: float):
	var result = one + two
	return result

static func sum_array(arr: Array):
	var sum = 0.0
	for element in arr:
		sum += element
	return sum

static func sub_array(arr: Array):
	var result = 0.0
	for element in arr:
		result -= element
	return result

static func mult_array(arr: Array):
	var result = 0.0
	for element in arr:
		result *= element
	return result

static func div_array(arr: Array):
	var result = 0.0
	for element in arr:
		result /= element
	return result

func _process(delta):
	# if Engine.editor_hint:
		
	# print(sum_array(numArr))
	pass

#print(addVal(4,4))
