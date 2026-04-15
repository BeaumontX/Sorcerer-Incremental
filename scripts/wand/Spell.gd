extends Resource
class_name Spell



@export var contents : Array[Rune]

var damage_instances : Array[Damage_Instance]
var refine_instances : Array[Refine_Instance]






func Use_Spell() -> void:
	pass

func Calculate_Spell() -> void:
	for i in contents:
		var rune : Rune = contents[i]
		
		match (rune):
			Rune_Modifier:
				AddToBuffer(rune)
			Rune_Auxiliary:
				pass
			Rune_Creation:
				pass
			Rune_Attack:
				var instance : Damage_Instance = rune.Do_Thing()
				ApplyBuffer(instance)
				

func CheckNextRune(id : int) -> void:
	contents[id+1].GetType()






var buffer_total : Buffer = Buffer.new()
var buffers : Array[Buffer] = [Buffer.new()]
var current_buffer : int = 0

func CreateBuffer() -> void:
	buffers[current_buffer] = Buffer.new()

func AddToBuffer(rune : Rune) -> void:
	buffer_total.AddToBuffer(rune)
	buffers[current_buffer].AddToBuffer(rune)

func ClearBuffer() -> void:
	buffers[current_buffer].ClearBuffer()

func ApplyBuffer(instance : Damage_Instance) -> void:
	instance
	
	
	
	current_buffer =+ 1
	CreateBuffer()

func CopyBuffer(new_amount : int) -> void:
	for i in range(current_buffer + 1, new_amount + current_buffer):
		var new_buffer : Buffer = buffers[current_buffer].duplicate()
		buffers.append(new_buffer)
		print("cur: ", current_buffer)
		print("i: ", i)
	print("amount: ", buffers.size())
