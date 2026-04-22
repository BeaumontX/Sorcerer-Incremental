extends Control

@onready var tab_fight = $Fight
@onready var tab_settings = $Settings

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Player.tab_change.connect(Change_Tab)
	Change_Tab(Player.current_tab)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func Change_Tab(new_tab : Tab_Menu.TabsList) -> void:
	Hide_Tabs()
	match new_tab:
		Tab_Menu.TabsList.Fight:
			tab_fight.show()
		#Tab_Menu.TabsList.Refine:
			#tab_refine.show()
		#Tab_Menu.TabsList.Inventory:
			#tab_inventory.show()
		#Tab_Menu.TabsList.Grimoire:
			#tab_grimoire.show()
		Tab_Menu.TabsList.Settings:
			tab_settings.show()

func Hide_Tabs() -> void:
	tab_fight.hide()
	#refine
	#inventory
	#grimiore
	tab_settings.hide()
	
