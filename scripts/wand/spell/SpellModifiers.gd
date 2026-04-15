extends Resource
class_name SpellModifiers


enum modifier_type {
	Additive,
	Multiplicative
}

@export var type : modifier_type
@export var stat : SpellStats.stat_list
@export var amount : float = 1
