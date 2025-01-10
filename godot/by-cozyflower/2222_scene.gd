extends Control

@onready var label: Label = $Label
@onready var go_button: Button = $GoButton
@onready var word_timer: Timer = $NextWordTimer
@onready var text_edit: TextEdit = $TextEdit
@onready var mistakes_label: Label = $MistakesLabel

var all_words: Array
var word_index: int = 0
var game_over: bool = false
var num_mistakes: int = 0


func _ready() -> void:
	# load in all the words
	var file_path = "res://2222.txt"
	var file_content = FileAccess.open(file_path, FileAccess.READ).get_as_text()
	all_words = file_content.split("\n")


func _on_go_button_pressed() -> void:
	# start the timer, we're not entering text
	go_button.visible = false
	text_edit.visible = false
	label.text = all_words[word_index]
	word_timer.start()


func _on_text_edit_focus_entered() -> void:
	# enter text, we're not starting the timer
	if go_button.visible:
		go_button.visible = false
		label.text = all_words[word_index]

func _on_next_word_timer_timeout() -> void:
	next_word()

func next_word():
	word_index += 1
	if word_index >= len(all_words):
		# if we get to the last entry, end the game
		end_game()
		return
	var new_word: String = all_words[word_index]
	if new_word == "":
		# or if we hit a newline, end the game
		end_game()
		return
	label.text = new_word

func end_game():
	game_over = true
	label.text = "You did it!"
	label.label_settings.font_size = 32
	word_timer.stop()

func _on_text_edit_text_changed() -> void:
	if not game_over and text_edit.text.to_lower() == all_words[word_index].to_lower():
		next_word()
		text_edit.text = ""
	elif text_edit.text:
		# check for mistakes:
		var text_len: int = len(text_edit.text)
		if text_len <= 4 and all_words[word_index][text_len - 1].to_lower() != text_edit.text.to_lower()[-1]:
			made_mistake()

func made_mistake() -> void:
	num_mistakes += 1
	mistakes_label.text = "Mistakes:\n" + str(num_mistakes)
	mistakes_label.visible = true
