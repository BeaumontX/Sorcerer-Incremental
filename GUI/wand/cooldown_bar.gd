extends PanelContainer

@onready var bar = $ProgressBar
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if bar.max_value != Player.timer_fight.wait_time:
		bar.max_value = Player.timer_fight.wait_time
	bar.value = Player.timer_fight.time_left
