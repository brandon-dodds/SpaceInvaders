extends Node

export (PackedScene) var theShot 
# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.start($PlayerStart.position)
	$Path2D/PathFollow2D/Enemy.start()
	
func _on_Player_playerShoot():
	shoot("player")

func _on_ShotTimer_timeout():
	shoot("enemy")

func shoot(shooter):
	var shot = theShot.instance()
	shot.init(shooter)
	add_child(shot)
	if shooter == "player":
		shot.position = $Player.position
	else:
		shot.position = $Path2D/PathFollow2D.position
