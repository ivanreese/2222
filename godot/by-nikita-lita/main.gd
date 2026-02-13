extends Control

var input_text: PackedStringArray
var current_index: int = 0
var last_changed_time: float = 0.0
var current_color: Color = Color("#000000")
var current_r = 1.0
var current_g = 1.0
var current_b = 1.0
var reverse = false

@onready var rich_text_label: RichTextLabel = $RichTextLabel

func get_input_text() -> PackedStringArray:
	# read res://input.txt, splt it into lines and return as PackedStringArray
	var file = FileAccess.open("res://input.txt", FileAccess.READ)
	var text = file.get_as_text()
	return text.split("\n")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_text = get_input_text()
	rich_text_label.text = input_text[current_index]

func modulate_color():
	if not reverse:
		if current_color.r < 1:
			current_color.r += 0.01
		elif current_color.g < 1:
			current_color.g += 0.01
		elif current_color.b < 1:
			current_color.b += 0.01
		else:
			reverse = true
	if reverse:
		if current_color.r > 0:
			current_color.r -= 0.01
		elif current_color.g > 0:
			current_color.g -= 0.01
		elif current_color.b > 0:
			current_color.b -= 0.01
		else:
			reverse = false
	rich_text_label.modulate = current_color


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	modulate_color()
	# every 604 msec, change the current index to a random index
	if Time.get_ticks_msec() - last_changed_time > 604:
		current_index += 1
		last_changed_time = Time.get_ticks_msec()
		rich_text_label.text = input_text[current_index]

	
