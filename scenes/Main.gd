extends Node

export (PackedScene) var theShot 
# Called when the node enters the scene tree for the first time.
var shotsOnScreen = []
func _ready():
	$Player.start($PlayerStart.position)
	$Path2D/PathFollow2D/Enemy.start()
	
func _on_Player_playerShoot():
	shoot("player")

func _on_Enemy_hit():
	for shot in shotsOnScreen:
		if shot.characterShoot == "enemy":
			print("Ignoring collision...")
		else:
			print("Enemy hit")
			shot.queue_free()
			$Path2D/PathFollow2D/Enemy.queue_free()

func _on_Player_hit():
	for shot in shotsOnScreen:
		if shot.characterShoot == "player":
			print("Ignoring collision...")
		else:
			print("player hit")
			shot.queue_free()
			shot.queue_free()


func _on_ShotTimer_timeout():
	shoot("enemy")

func shoot(shooter):
	var shot = theShot.instance()
	shot.init(shooter)
	add_child(shot)
	shotsOnScreen.append(shot)
	if shooter == "player":
		shot.position = $Player.position
	else:
		shot.position = $Path2D/PathFollow2D.position
