@tool
extends Control
class_name Wand_Menu


enum TabsList {
	Fight,
	Refine,
	Inventory,
	Grimoire,
	Settings
}

@onready var scrollcontainer : ScrollContainer
@onready var runecontainer : HBoxContainer
var runebuttons_list : Array[Rune_Button]

@onready var panel : Panel
@onready var container : HBoxContainer

@onready var wand_button : Wand_Button
var wand_button_size : float





var wand : Wand :
	get:
		if wand_button.wand != null:
			return wand_button.wand
		return null

@onready var tabs : Dictionary[int, Rune_Button] = {
	#TabsList.Settings: $VBoxContainer/Settings,
	
}





func _ready() -> void:
	Setups()
	
	Resize_ScrollContainer()
	CreateRuneButtons()
	FillRuneButtons()
	

func _process(delta: float) -> void:
	pass



func SelectTab(tab : TabsList) -> void:
	for i in tabs:
		tabs[i].UnSelect()
	tabs[tab].Select()
	print("Tab selected: ", tab)

func ConnectSignals() -> void:
	for i in tabs:
		tabs[i].pressed.connect(SelectTab)


func _on_wand_button_resized() -> void:
	wand_button_size = wand_button.size.x
	Resize_ScrollContainer()
	Adjust_Panel()

func _on_container_resized() -> void:
	if panel == null:
		return
	Adjust_Panel()



func Resize_ScrollContainer() -> void:
	scrollcontainer.custom_minimum_size.x = wand_button_size * 6

func Adjust_Panel() -> void:
	panel.size = container.size
	panel.position = container.position
	var border_size : float = wand_button.size.x / 16
	
	
	var newstyle : StyleBoxFlat = panel.get_theme_stylebox("panel").duplicate()
	newstyle.border_width_top = border_size
	newstyle.border_width_bottom = border_size
	newstyle.border_width_left = 0
	newstyle.border_width_right = border_size
	
	panel.add_theme_stylebox_override("panel", newstyle)


func Setups() -> void:
	if scrollcontainer == null:
		Setup_ScrollContainer()
	if runecontainer == null:
		Setup_RuneContainer()
	if wand_button == null:
		Setup_WandButton()
	if container == null:
		Setup_Container()
	if panel == null:
		Setup_Panel()

func Setup_ScrollContainer() -> void:
	scrollcontainer = $"HBoxContainer/ScrollContainer"

func Setup_RuneContainer() -> void:
	runecontainer = $HBoxContainer/ScrollContainer/HBoxContainer

func Setup_WandButton() -> void:
	wand_button = $"HBoxContainer/Wand Button"

func Setup_Container() -> void:
	container = $HBoxContainer

func Setup_Panel() -> void:
	panel = $Panel



func CreateRuneButtons() -> void:
	var template = preload("res://GUI/wand/rune_button.tscn")
	for i in wand.rune_capacity:
		var new_button = template.instantiate()
		if i == 0:
			new_button.first = true
		if i == (wand.rune_capacity - 1):
			new_button.last = true
		new_button.rune_id = i
		
		runebuttons_list.append(new_button)
		runecontainer.add_child(new_button)


func FillRuneButtons() -> void:
	var cur_spell : Spell = Player.current_spell
	for i in cur_spell.contents.size():
		runebuttons_list[i].SetRune()
