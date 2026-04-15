extends Resource
class_name SpellEffects


enum effect_list {
	Burn, #Fire DoT
	Wet, #Water Make electricity and frost ignore shields
	Grounded, #Ground Lowers avasion, gives immunity to lightning
	
	Void, #Void Cleans all the effects on use, including itself
	
	TimeDilation, #Time Makes all DoT effects do all the damage instantly, cleans all the effects on enemy
	
	Decay, #Death Applies
	
	Arcana #Arcana 
}
