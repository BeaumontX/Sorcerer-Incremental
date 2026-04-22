extends Resource
class_name SpellStats

enum stat_list {
	elemental_damage,
	mass,
	speed,
	stress,
	mana_cost
}

@export var elemental_damage : float = 100
@export var element : Elements.list = Elements.list.Arcana

@export var mass : float = 1
@export var speed : float = 1

@export_range(1,4) var level : int = 1
@export_range(0, 100) var stress : float = 0
@export var mana_cost : float = 100

func CalcDamage() -> float:
	return mass * speed + elemental_damage
