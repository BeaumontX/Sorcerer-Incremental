extends PanelContainer

@onready var bar = $ProgressBar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Player.current_wand == null:
		return
	if bar.max_value != Player.current_wand.mana_capacity:
		bar.max_value = Player.current_wand.mana_capacity
	bar.value = Player.current_wand.mana_current
