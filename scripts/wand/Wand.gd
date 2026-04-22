extends Resource
class_name Wand

@export var name : String = "Default Name"
@export var icon : Texture2D

@export var type : types = types.Error
enum types {
	Normal,
	Scepter,
	Staff,
	Error
}

func GetType() -> types:
	return type








@export var mana_capacity : float = 1000
var mana_current : float = mana_capacity
@export var mana_recharge : float = 10

@export var rune_capacity : int = 5


@export var cooldown : float = 60

@export var spells : Array[Spell]
@export var memory : int = 3




func Recharge(delta : float) -> void:
	if mana_current < mana_capacity:
		mana_current += mana_recharge * delta
	mana_current = clamp(mana_current, 0, mana_capacity)

func Setup_Spells() -> void:
	for i in memory:
		if spells.size() < i:
			spells.append(Spell.new())

func Setup_Timer(timer : Timer) -> void:
	timer.wait_time = cooldown
	timer.start()
