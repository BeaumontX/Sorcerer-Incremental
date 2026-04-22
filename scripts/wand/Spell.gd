extends Resource
class_name Spell



@export var contents : Array[Rune]

var damage_instances : Array[Damage_Instance]
var refine_instances : Array[Refine_Instance]

var is_spell_ready : bool = false

func Change_Rune(rune : Rune, id : int) -> void:
	if contents.size() < id + 1:
		contents.resize(id + 1)
	contents[id] = rune
	is_spell_ready = false
	Calculate_Spell()
	Player.Save()



func Use_Spell() -> void:
	pass

func Calculate_Spell() -> void:
	damage_instances.clear()
	refine_instances.clear()
	for i in contents:
		if i == null:
			continue
		var rune : Rune = i
		
		match (rune.type):
			Rune.types.Modifier:
				AddToBuffer(rune)
			Rune.types.Auxiliary:
				pass
			Rune.types.Creation:
				pass
			Rune.types.Attack:
				var instance : Damage_Instance = rune.Do_Thing()
				ApplyBuffer(instance)
				damage_instances.append(instance)
				print("is attack runes")
			_:
				pass
	is_spell_ready = true
	print("calculated")

func CheckNextRune(id : int) -> void:
	contents[id+1].GetType()






var buffer_total : Buffer = Buffer.new()
var buffers : Array[Buffer] = []
var current_buffer : int = 0

func CreateBuffer() -> void:
	if buffers.size() < current_buffer:
		buffers.resize(current_buffer + 1)
	buffers[current_buffer] = Buffer.new()

func AddToBuffer(rune : Rune) -> void:
	buffer_total.AddToBuffer(rune)
	if buffers[current_buffer] == null:
		CreateBuffer()
	buffers[current_buffer].AddToBuffer(rune)

func ClearBuffer() -> void:
	buffers[current_buffer].ClearBuffer()

func ResetBuffers() -> void:
	is_spell_ready = false
	buffers.clear()
	buffer_total = Buffer.new()

func ApplyBuffer(instance : Damage_Instance) -> void:
	
	current_buffer =+ 1
	CreateBuffer()

func CopyBuffer(new_amount : int) -> void:
	for i in range(current_buffer + 1, new_amount + current_buffer):
		var new_buffer : Buffer = buffers[current_buffer].duplicate()
		buffers.append(new_buffer)
		print("cur: ", current_buffer)
		print("i: ", i)
	print("amount: ", buffers.size())
