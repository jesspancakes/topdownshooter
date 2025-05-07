extends Node

signal kills_changed(count)

var kill_count: int = 0:
	set(value):
		kill_count = value
		emit_signal("kills_changed", kill_count)

func add_kill():
	kill_count += 1
