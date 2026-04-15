extends Resource
class_name Damage_Instance

var stats : SpellStats = SpellStats.new()
var effects : SpellEffects = SpellEffects.new()

func Set_Stats(new_stats : SpellStats) -> void:
	stats = new_stats
func Set_Effects(new_effects : SpellEffects) -> void:
	effects = new_effects
