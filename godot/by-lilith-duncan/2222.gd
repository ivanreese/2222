extends Label3D

var tick = 0.0
var lines: PackedStringArray
var index = -1
var started = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var file = FileAccess.open("res://2222.txt", FileAccess.READ)
	var content = file.get_as_text()
	lines = content.split("\n")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_SPACE) && !started:
		started = true
		change_word()
	if not started: return
	tick += delta
	if tick > 0.6039604:
		tick -= 0.6039604
		change_word()
		
func change_word():
	index += 1
	self.text = lines[index]
