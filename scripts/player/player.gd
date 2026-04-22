extends Node

var runelist : RuneList
var current_runebutton : Rune_Button


var current_tab : Tab_Menu.TabsList :
	set(new_tab):
		current_tab = new_tab
		tab_change.emit(new_tab)
signal tab_change(new_tab)

var current_wand : Wand :
	get:
		if current_tab == Tab_Menu.TabsList.Fight:
			return wand_fight
		elif current_tab == Tab_Menu.TabsList.Refine:
			return wand_refine
		else:
			return null

var current_spell : Spell:
	get:
		if current_tab == Tab_Menu.TabsList.Fight:
			return wand_fight.spells[savedata.fight_spell_id]
		elif current_tab == Tab_Menu.TabsList.Refine:
			return wand_refine.spells[savedata.refine_spell_id]
		else:
			return null


@export var savedata : SaveData = SaveData.new()

var wand_fight : Wand :
	get:
		if savedata == null:
			return null
		return savedata.wand_fight
var wand_refine : Wand :
	get:
		if savedata == null:
			return null
		return savedata.wand_refine
var inventory : Array[Wand] :
	get:
		return savedata.inventory






var timer_fight : Timer = Timer.new()
var timer_refine : Timer = Timer.new()



var current_enemy : Enemy





func _ready() -> void:
	Load()
	Setup_Wands()
	
	Settings_General.SetLocale(savedata.language)
	
	if OS.is_debug_build():
		TestOnReady()



func Change_Spell(id : int) -> void:
	pass
	#savedata.Change_Spell()











func Save() -> void:
	SaveManager.SaveGame(savedata)
	print("game saved")

func Load() -> void:
	savedata = SaveManager.GetSave()

















func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	Recharge(delta)


func Recharge(delta) -> void:
	if current_wand == null:
		return
	current_wand.Recharge(delta)

func Setup_Wands() -> void:
	wand_fight.Setup_Spells()
	add_child(timer_fight)
	wand_fight.Setup_Timer(timer_fight)
	
	timer_fight.timeout.connect(Cast_Fight)
	print("cd: ", wand_fight.cooldown)
	
	
	wand_refine.Setup_Spells()
	add_child(timer_refine)
	wand_refine.Setup_Timer(timer_refine)

func Cast_Fight() -> void:
	var wand : Wand = wand_fight
	var spell : Spell = wand_fight.spells[savedata.fight_spell_id]
	for i in spell.damage_instances:
		wand.mana_current -= i.stats.mana_cost
		current_enemy.ReceiveDamage(i.stats.CalcDamage())


func TestOnReady() -> void:
	pass
