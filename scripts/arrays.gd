extends Node

var slots_id = []
var slots = []
var letters = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
var result = []
var error_num = 0

func compare():
	for i in range(16):
		if slots[i] == letters[i]:
			result.append(1)
		else:
			result.append(0)
	
	for i in range(16):
		if result[i] == 1:
			print("\nNa posição #" + str(i) + " você acertou!!")
		else:
			print("\nNa posição #" + str(i) + " você errou!!")

func reset():
	Arrays.slots_id.clear()
	Arrays.slots.clear()
	Arrays.letters = ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""]
	Arrays.result.clear()
