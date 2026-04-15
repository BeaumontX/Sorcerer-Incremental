extends Resource
class_name Wand

@export var name : String = "Default Name"
@export var icon : Texture2D

@export var mana_capacity : float = 1000
var mana_current : float = mana_capacity
@export var mana_recharge : float = 10

@export var rune_capacity : float = 5


@export var cooldown : float = 60

@export var spells : Array[Spell]
@export var memory : int = 3
