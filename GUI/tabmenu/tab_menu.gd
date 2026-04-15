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



@export var current_tab : TabsList = TabsList.Fight :
	set(tab):
		current_tab = tab
		SelectTab(tab)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ConnectSignals()


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
