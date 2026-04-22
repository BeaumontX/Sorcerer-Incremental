@tool
extends Control

@onready var container : VBoxContainer

@onready var bar : ProgressBar
@onready var bar_margin : MarginContainer
@onready var bar_label : Label

@onready var panel : PanelContainer
@onready var texture : TextureRect

@export var enemy : Enemy = preload("res://resources/enemies/Evil Rock.res")

#ResourceLists.enemies_dict[ResourceLists.enemies.Evil_Rock]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Setups()
	
	
	texture.texture = enemy.icon
	enemy.hp_changed.connect(func(new_hp : float): bar.value = new_hp)
	enemy.max_hp_changed.connect(func(new_max_hp : float): bar.max_value = new_max_hp)
	enemy.CalcStats()
	Player.current_enemy = enemy
	
	SetSize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func SetSize() -> void:
	var newsize : float = get_viewport_rect().size.y * 0.6
	panel.custom_minimum_size = Vector2(newsize, newsize)
	bar_margin.add_theme_constant_override("margin_top", newsize * 0.05)
	bar_margin.add_theme_constant_override("margin_bottom", newsize * 0.2)







func Setups() -> void:
	if container == null:
		container = $VBoxContainer
	
	if bar_margin == null:
		bar_margin = $VBoxContainer/MarginContainer
	if bar == null:
		bar = $VBoxContainer/MarginContainer/ProgressBar
	if bar_label == null:
		bar_label = $VBoxContainer/MarginContainer/Label
	
	if panel == null:
		panel = $VBoxContainer/PanelContainer
	if texture == null:
		texture = $VBoxContainer/PanelContainer/TextureRect


func _on_progress_bar_value_changed(value: float) -> void:
	var result : String = "%0.2f" % value + " / " + "%0.2f" % bar.max_value
	bar_label.text = result
