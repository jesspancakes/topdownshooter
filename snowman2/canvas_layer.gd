extends CanvasLayer

@onready var kill_label = $KillLabel

func _ready():
	ScoreManager.connect("kills_changed", update_kills)
	update_kills(ScoreManager.kill_count)

func update_kills(count: int):
	if kill_label:
		kill_label.text = "New Friends: %d" % count
