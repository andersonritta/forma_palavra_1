extends Node

var slots_id = []
var slot = []
var letters = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
var result = []
var error_num = 0

func compare():
	for i in range(16):
		if slot[i] == letters[i]:
			result.append(1)
		else:
			result.append(0)
	
	print(result)

func reset():
	Arrays.slots_id.clear()
	Arrays.slot.clear()
	Arrays.letters = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
	Arrays.result.clear()
