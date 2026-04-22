@tool
extends PanelContainer
class_name  Rune_Button



static var blank : Texture2D = preload("res://GUI/icons/Slot.png")




var rune_id : int
@export var rune : Rune :
	set(new_rune):
		if new_rune == null:
			icon = blank
			ChangeRune(null)
			return
		rune = new_rune
		icon = rune.icon
		ChangeRune(rune)



@export var icon : Texture2D :
	set(newicon):
		icon = newicon
		if texture and newicon != null:
			SetTexture(newicon)




@export var first : bool = false :
	set(newbool):
		first = newbool
		if border:
			SetBorderSize()
@export var last : bool = false :
	set(newbool):
		last = newbool
		if border:
			SetBorderSize()

@export var selected : bool = false :
	set(newbool):
		selected = newbool
		if border:
			SetBorderSize()


@onready var texture : TextureRect
@onready var texture_margin : MarginContainer
@onready var border : Panel
@onready var button : Button


func _ready() -> void:
	Setups()
	
	SetBorderSize()

func _process(delta: float) -> void:
	pass







func SetRune() -> void:
	var spell : Spell = Player.current_spell
	if (spell.contents.size()-1) >= rune_id:
		rune = spell.contents[rune_id]

func ChangeRune(rune : Rune) -> void:
	var spell : Spell = Player.current_spell
	spell.Change_Rune(rune, rune_id)
	print("new rune: ", spell.contents[rune_id])










func SetTexture(newtexture : Texture2D) -> void:
	texture.texture = newtexture

func SetBorderSize() -> void:
	var border_size : float = self.size.x / 16
	SetMargin(border_size)
	
	var newstyle : StyleBoxFlat = border.get_theme_stylebox("panel").duplicate()
	if first:
		newstyle.border_width_left = border_size
	else:
		newstyle.border_width_left = border_size/2
	
	if last:
		newstyle.border_width_right = border_size
	else:
		newstyle.border_width_right = border_size/2
	
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

func Setup_Border() -> void:
	border = $Panel

func Setup_Button() -> void:
	button = $Button

func Setup_TextureMargin() -> void:
	texture_margin = $MarginContainer


signal pressed(type)


func _on_button_pressed() -> void:
	pressed.emit("123")
	print("rune_button pressed")
	Player.runelist.show()
	Player.current_runebutton = self


func _on_self_resized() -> void:
	SetBorderSize()
