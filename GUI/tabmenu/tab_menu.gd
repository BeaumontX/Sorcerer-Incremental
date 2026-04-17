@tool
extends Control
class_name Tab_Menu


enum TabsList {
	Fight,
	Refine,
	Inventory,
	Grimoire,
	Settings
}

@onready var tabs : Dictionary[int, Tabmenu_Button] = {
	TabsList.Fight: $VBoxContainer/Fight,
	TabsList.Refine: $VBoxContainer/Refine,
	TabsList.Inventory: $VBoxContainer/Inventory,
	TabsList.Grimoire: $VBoxContainer/Grimoire,
	TabsList.Settings: $VBoxContainer/Settings,
	
}



func _ready() -> void:
	ConnectSignals()
	SelectTab(Player.current_tab)


func _process(delta: float) -> void:
	pass


func SelectTab(tab : TabsList) -> void:
	for i in tabs:
		tabs[i].UnSelect()
	tabs[tab].Select()

func ConnectSignals() -> void:
	for i in tabs:
		tabs[i].pressed.connect(func(new_tab): Player.current_tab = new_tab)
	
	Player.tab_change.connect(SelectTab)
