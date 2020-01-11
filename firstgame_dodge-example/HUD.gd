extends CanvasLayer

signal start_game

func show_message(text):
	$MsgLabel.text = text
	$MsgLabel.show()
	$MsgTimer.start()

func show_game_over():
	show_message("Game Over")
	yield($MsgTimer, "timeout")
	$MsgLabel.text = "Dodge the\nCreeps"
	$MsgLabel.show()
	yield(get_tree().create_timer(1), 'timeout')
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)


func _on_MsgTimer_timeout():
	$MsgLabel.hide()


func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
