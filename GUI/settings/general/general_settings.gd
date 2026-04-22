extends Control
class_name Settings_General



@onready var theme_button : OptionButton = %OptionButton_Theme
@onready var language_button : OptionButton = %OptionButton_Language




enum languages {
	ru,
	en,
}
const language_list : Dictionary[languages, String] = {
	languages.ru: "ru",
	languages.en: "en"
}


enum themes {
	dark,
	light
}
const theme_list : Dictionary[themes, Theme] = {
	themes.dark: preload("uid://dc3mbdkx6o40"),
	themes.light: preload("uid://c1f168pbtanbg")
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SetTheme(Player.savedata.theme)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_language_selected(index: int) -> void:
	SetLocale(index, true)

static func SetLocale(lang_id : languages, save : bool = false) -> void:
	TranslationServer.set_locale(language_list[lang_id])
	
	if save:
		Player.savedata.language = lang_id
		Player.Save()


func _on_theme_selected(index: int) -> void:
	SetTheme(index, true)

func SetTheme(theme_id : themes, save : bool = false) -> void:
	var scene = get_tree().current_scene
	if scene is Control:
		get_tree().current_scene.theme = theme_list[theme_id]
	
	if save:
		Player.savedata.theme = theme_id
		Player.Save()
