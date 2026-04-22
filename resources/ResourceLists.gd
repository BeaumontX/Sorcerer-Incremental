@tool
extends Resource
class_name ResourceLists

const folder : String = "res://resources"
enum paths {
	runes,
	spells,
	wands,
	enemies,
}
const paths_dict : Dictionary[paths, String] = {
	paths.runes: "/runes/",
	paths.spells: "/spells/",
	paths.wands: "/wands/",
	paths.enemies: "/enemies/"
}

static func GetPath(type : paths) -> String:
	return folder + paths_dict[type]




enum runes {
	Pebble_Throw,
}
const runes_dict : Dictionary[runes, String] = {
	runes.Pebble_Throw: "res://resources/runes/Attack/Pebble Throw.res"
}
static func SaveRune(new_rune : Rune) -> void:
	var rune : Rune = new_rune.duplicate()
	var name : String = rune.name + ".res"
	var subfolder : String = rune.types.keys()[rune.type] + "/"
	var path : String = GetPath(paths.runes) + subfolder + name
	
	var result : bool = ResourceSaver.save(rune, path)
	SaveMessage(result, name)



enum spells {
	
}
const spells_dict : Dictionary[spells, String] = {
	
}
static func SaveSpell(spell : Spell) -> void:
	var name : String = spell.name + ".res"
	var path : String = GetPath(paths.spells) + name
	
	var result : bool = ResourceSaver.save(spell, path)
	SaveMessage(result, name)

enum wands {
	Stick_Wand,
}
const wands_dict : Dictionary[wands, String] = {
	wands.Stick_Wand: "res://resources/wands/Normal/Stick Wand.res"
}
static func SaveWand(wand : Wand) -> void:
	var name : String = wand.name + ".res"
	var subfolder : String = wand.types.keys()[wand.type] + "/"
	var path : String = GetPath(paths.wands) + subfolder + name
	
	var result : bool = ResourceSaver.save(wand, path)
	SaveMessage(result, name)

enum enemies {
	Evil_Rock,
}
const enemies_dict : Dictionary[enemies, String] = {
	enemies.Evil_Rock: "res://resources/enemies/Evil Rock.res"
}
static func SaveEnemy(enemy : Enemy) -> void:
	var name : String = enemy.name + ".res"
	var path : String = GetPath(paths.enemies) + name
	
	var result : bool = ResourceSaver.save(enemy, path)
	SaveMessage(result, name)




static func SaveMessage(result : bool, name : String) -> void:
	if result:
		print("Resource " + name + " was not saved")
	else:
		print("Saved: " + name)
