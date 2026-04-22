@tool
extends PanelContainer
class_name  RuneList_Button








@export var rune : Rune :
	set(new_rune):
		if new_rune == null:
			return
		rune = new_rune
		icon = rune.icon
		print("rune: ", rune.name)
		print("rune icon: ", rune.icon.resource_path)



@export var icon : Texture2D :
	set(newicon):
		icon = newicon
		if texture and newicon != null:
			SetTexture(newicon)
			print("texture")





@onready var texture : TextureRect
@onready var texture_margin : MarginContainer
@onready var border : Panel
@onready var button : Button


func _ready() -> void:
	Setups()
	
	SetBorderSize()

func _process(delta: float) -> void:
	pass







func SetRune(new_rune : Rune) -> void:
	rune = new_rune












func SetTexture(newtexture : Texture2D) -> void:
	texture.texture = newtexture

func SetBorderSize() -> void:
	var border_size : float = self.size.x / 16
	SetMargin(border_size)
	
	var newstyle : StyleBoxFlat = border.get_theme_stylebox("panel").duplicate()
	newstyle.border_width_left = border_size
	newstyle.border_width_right = border_size
	newstyle.border_width_top = border_size
	newstyle.border_width_bottom = border_size
	
	border.add_theme_stylebox_override("panel", newstyle)

func SetMargin(margin : float) -> void:
	texture_margin.add_theme_constant_override("margin_top", margin)
	texture_margin.add_theme_constant_override("margin_left", margin)
	texture_margin.add_theme_constant_override("margin_bottom", margin)
	texture_margin.add_theme_constant_override("margin_right", margin)



func Setups() -> void:
	if texture_margin == null:
		Setup_TextureMargin()
	if texture == null:
		Setup_Texture()
	if border == null:
		Setup_Border()
	if button == null:
		Setup_Button()

func Setup_Texture() -> void:
	texture = $"MarginContainer/TextureRect"
	icon = icon

func Setup_Border() -> void:
	border = $Panel

func Setup_Button() -> void:
	button = $Button

func Setup_TextureMargin() -> void:
	texture_margin = $MarginContainer


signal hidelist()

func _on_button_pressed() -> void:
	hidelist.emit()
	print("runelist_button pressed")
	Player.current_runebutton.rune = rune


func _on_self_resized() -> void:
	SetBorderSize()
