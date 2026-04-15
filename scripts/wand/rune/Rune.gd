@abstract
extends Resource
class_name Rune

@export var name : String = "Default Name"
@export var type : types
enum types {
	Creation,
	Attack,
	Modifier,
	Auxiliary
}



func GetType() -> types:
	return type

@abstract func Do_Thing()
