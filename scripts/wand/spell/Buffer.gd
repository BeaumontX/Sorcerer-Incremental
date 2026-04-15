extends Resource
class_name Buffer


var buffer : Array[Rune_Modifier]

func AddToBuffer(rune : Rune) -> void:
	buffer.append(rune)

func ClearBuffer() -> void:
	buffer.clear()
