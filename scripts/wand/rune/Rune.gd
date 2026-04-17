@abstract
extends Resource
class_name Rune

@export var name : String = "Default Name"
@export var icon : Texture2D
@export var type : types = types.Error
enum types {
	Creation,
	Attack,
	Modifier,
	Auxiliary,
	Error
}



func GetType() -> types:
	return type

func Do_Thing():
	pass
