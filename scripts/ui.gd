extends Control

@onready var focus = $Focus
@onready var actions: Array[Node] = $HBoxContainer.get_children()
var action_index := 0

func _input(event):
	if event.is_action_pressed("ui_right"):
		action_index += 1
	elif event.is_action_pressed("ui_left"):
		action_index -= 1
	change_focused()

func _ready():
	await get_tree().process_frame
	focus.global_position = actions[0].global_position
	change_focused()
	
func change_focused():
	var temp_index = action_index % 4
	focus.scale = actions[temp_index].scale
	focus.size = actions[temp_index].size
	
	var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)
	tween.tween_property(focus, "global_position", actions[temp_index].global_position, 0.5)
	
