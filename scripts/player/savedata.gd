extends Resource
class_name SaveData

enum wandtype {
	fight,
	refine
}

@export var wand_fight : Wand :
	get:
		return inventory[fight_wand_id]
var fight_wand_id : int = 0
var fight_spell_id : int = 0

@export var wand_refine : Wand:
	get:
		return inventory[fight_wand_id]
var refine_wand_id : int = 0
var refine_spell_id : int = 0


@export var inventory : Array[Wand] = [
	load(ResourceLists.wands_dict[ResourceLists.wands.Stick_Wand])
]

func Change_Wand(wand_type : wandtype, id : int) -> void:
	match wand_type:
		wandtype.fight:
			if id != fight_wand_id:
				fight_wand_id = id
		wandtype.refine:
			if id != refine_wand_id:
				refine_wand_id = id

func Change_Spell(wand_type : wandtype, id : int) -> void:
	match wand_type:
		wandtype.fight:
			if id != fight_spell_id:
				fight_spell_id = id
		wandtype.refine:
			if id != refine_spell_id:
				refine_spell_id = id
