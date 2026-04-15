extends Node


@export var wand_fight : Wand = Wand.new()
@export var wand_refine : Wand = Wand.new()

@export var inventory : Array[Wand]


var timer_fight : Timer = Timer.new()
var timer_refine : Timer = Timer.new()

func _ready() -> void:
	Setup_Spells(wand_fight)
	Setup_Timer(wand_fight, timer_fight)
	if OS.is_debug_build():
		TestOnReady()

func _process(delta: float) -> void:
	Recharge(wand_fight, delta)




func Recharge(wand : Wand, delta : float) -> void:
	if wand.mana_current < wand.mana_capacity:
		wand.mana_current += wand.mana_recharge * delta
		wand.mana_current = clamp(wand.mana_current, 0, wand.mana_capacity)




func Setup_Spells(wand : Wand) -> void:
	for i in wand.memory:
		if wand.spells.size() < i:
			wand.spells.append(Spell.new())


func Setup_Timer(wand : Wand, timer : Timer) -> void:
	timer.one_shot = true
	timer.wait_time = wand.cooldown


func TestOnReady() -> void:
	pass
