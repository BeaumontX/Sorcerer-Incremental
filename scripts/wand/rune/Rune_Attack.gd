extends Rune
class_name Rune_Attack




@export var stats : SpellStats = SpellStats.new()
@export var effects : SpellEffects = SpellEffects.new()



func Do_Thing() -> Damage_Instance:
	var instance : Damage_Instance = Damage_Instance.new()
	instance.Set_Stats(stats)
	
	return instance
