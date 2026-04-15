extends Resource

var folder_path : String = "res://resources"
var runes_path : String = "/runes/"
var spells_path : String = "/spells/"
var wands_path : String = "/wands/"
var enemies_path : String = "/enemies/"


enum runes {
	pebble,
}
var runes_dict : Dictionary[runes, String] = {
	runes.pebble: ""
}

enum spells {
	
}
var spells_dict : Dictionary[spells, String]

enum wands {
	
}
var wands_dict : Dictionary[wands, String]

enum enemies {
	
}
var enemies_dict : Dictionary[enemies, String]
