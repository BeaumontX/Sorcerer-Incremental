@tool
extends Node2D

@export var new_rune : Rune
@export var save_rune : bool:
	set(toggle):
		if new_rune != null:
			ResourceLists.SaveRune(new_rune)

@export var new_spell : Spell
@export var save_spell : bool:
	set(toggle):
		if new_spell != null:
			ResourceLists.SaveSpell(new_spell)

@export var new_wand : Wand
@export var save_wand : bool:
	set(toggle):
		if new_wand != null:
			ResourceLists.SaveWand(new_wand)

@export var new_enemy : Enemy
@export var save_enemy : bool:
	set(toggle):
		if new_enemy != null:
			ResourceLists.SaveEnemy(new_enemy)



func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
