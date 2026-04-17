extends Resource
class_name SpellEffects

@export var effects : Dictionary[effect_list, bool] = {
	effect_list.Burn: false,
	effect_list.Wet: false,
	effect_list.Grounded: false,
	
	effect_list.Void: false,

	effect_list.TimeDilation: false,

	effect_list.Decay: false,

	effect_list.Arcana: false,
}

enum effect_list {
	Burn, #Fire DoT
	Wet, #Water Make electricity and frost ignore shields
	Grounded, #Ground Lowers avasion, gives immunity to lightning
	
	Void, #Void Cleans all the effects on use, including itself
	
	TimeDilation, #Time Makes all DoT effects do all the damage instantly, cleans all the effects on enemy
	
	Decay, #Death Applies
	
	Arcana #Arcana 
}
