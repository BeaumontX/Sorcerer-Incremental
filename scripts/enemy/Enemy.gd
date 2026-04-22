extends Resource
class_name Enemy


@export var name : String = "Default Name"
@export var icon : Texture2D

@export var element : Elements.list = Elements.list.Arcana

@export var base_hp : float = 100
@export var base_defense : float = 10

var hp : float :
	set(new_max_hp):
		hp = new_max_hp
		max_hp_changed.emit(hp)
var defense : float

var current_hp : float :
	set(new_hp):
		current_hp = clamp(new_hp, 0, hp)
		hp_changed.emit(current_hp)
signal hp_changed(new_hp)
signal max_hp_changed(new_max_hp)


func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass


func CalcStats(hp_scalar : float = 1, def_scalar : float = 1) -> void:
	hp = base_hp * hp_scalar
	current_hp = hp
	defense = base_defense * def_scalar

func ReceiveDamage(damage : float) -> void:
	current_hp -= max(damage - defense, 0)

func Heal(amount : float) -> void:
	current_hp += min(amount, hp)
