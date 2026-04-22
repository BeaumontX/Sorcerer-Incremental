@tool
extends Control
class_name RuneList

@onready var attack_list : RuneList_Tab
@onready var creation_list : RuneList_Tab
@onready var modifier_list : RuneList_Tab
@onready var auxiliary_list : RuneList_Tab

@onready var panel : PanelContainer = $PanelContainer


func _ready() -> void:
	Setups()
	
	
	CreateRuneListButtons()
	Player.runelist = self
	hide()

func Setups() -> void:
	if attack_list == null:
		Setup_AttackList()
	if creation_list == null:
		Setup_CreationList()
	if modifier_list == null:
		Setup_ModifierList()
	if auxiliary_list == null:
		Setup_AuxiliaryList()

func Setup_AttackList() -> void:
	attack_list = $PanelContainer/ScrollContainer/MarginContainer/VBoxContainer/Attack

func Setup_CreationList() -> void:
	creation_list = $PanelContainer/ScrollContainer/MarginContainer/VBoxContainer/Creation

func Setup_ModifierList() -> void:
	modifier_list = $PanelContainer/ScrollContainer/MarginContainer/VBoxContainer/Modifier

func Setup_AuxiliaryList() -> void:
	auxiliary_list = $PanelContainer/ScrollContainer/MarginContainer/VBoxContainer/Auxiliary






func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	ClickOutside(event)



func CreateRuneListButtons() -> void:
	var template = preload("res://GUI/runelist/runelist_button.tscn")
	var blank_button = template.instantiate()
	blank_button.rune = null
	attack_list.AddButton(blank_button.duplicate())
	creation_list.AddButton(blank_button.duplicate())
	modifier_list.AddButton(blank_button.duplicate())
	auxiliary_list.AddButton(blank_button.duplicate())
	
	for i in ResourceLists.runes_dict:
		var rune : Rune = load(ResourceLists.runes_dict[i])
		var new_button = template.instantiate()
		new_button.SetRune(rune)
		AppendButtonToList(rune, new_button)

#func FillRuneButtons() -> void:
	#var cur_spell : Spell = Player.current_spell
	#for i in cur_spell.contents.size():
		#runebuttons_list[i].SetRune()


func AppendButtonToList(rune : Rune, button : RuneList_Button) -> void:
	var type : Rune.types = rune.type
	match type:
		Rune.types.Attack:
			attack_list.AddButton(button)
		Rune.types.Creation:
			creation_list.AddButton(button)
		Rune.types.Modifier:
			modifier_list.AddButton(button)
		Rune.types.Auxiliary:
			auxiliary_list.AddButton(button)
		_:
			return
	button.hidelist.connect(func(): hide())


func ClickOutside(event : InputEvent) -> void:
	if ((event is InputEventMouseButton) or (event is InputEventScreenTouch)) and event.is_pressed():
		var rect : Rect2 = panel.get_rect()
		if !rect.has_point(event.position):
			print("runelist hidden")
			hide()
