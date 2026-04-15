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

@onready var panel : Panel
@onready var container : HBoxContainer

@onready var wand_button : Wand_Button
var wand_size : float

@export var wand_fight : Wand = Player.wand_fight
@export var wand_refine : Wand = Player.wand_refine

@onready var tabs : Dictionary[int, Rune_Button] = {
	#TabsList.Settings: $VBoxContainer/Settings,
	
}





func _ready() -> void:
	Setups()
	
	Resize_ScrollContainer()

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
	wand_size = wand_button.size.x
	Resize_ScrollContainer()
	Adjust_Panel()




func Resize_ScrollContainer() -> void:
	scrollcontainer.custom_minimum_size.x = wand_size * 6

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
	if wand_button == null:
		Setup_WandButton()
	if container == null:
		Setup_Container()
	if panel == null:
		Setup_Panel()

func Setup_ScrollContainer() -> void:
	scrollcontainer = $"HBoxContainer/ScrollContainer"

func Setup_WandButton() -> void:
	wand_button = $"HBoxContainer/Wand Button"

func Setup_Container() -> void:
	container = $HBoxContainer

func Setup_Panel() -> void:
	panel = $Panel
