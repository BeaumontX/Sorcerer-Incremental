@tool
extends VBoxContainer
class_name RuneList_Tab

@export var text : String = "Unnamed Tab"

@onready var label : RichTextLabel = $RichTextLabel
@onready var container : HFlowContainer = $HFlowContainer

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_rich_text_label_finished(source) -> void:
	source.text = text


func AddButton(button : RuneList_Button) -> void:
	container.add_child(button)
