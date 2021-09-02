extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.start($PlayerStart.position)
	$Path2D/PathFollow2D/Enemy.start()
	
func _on_Player_playerShoot():
	if $Shot.shotOnScreen == false:
		$Shot.shotOnScreen = true
		$Shot.position = $Player.position
		$Shot.shoot("player")


func _on_Enemy_hit():
	if $Shot.characterShoot == "enemy":
		print("Ignoring collision...")
	else:
		print("Enemy hit")
		$Shot.hide()
		$Shot.position = Vector2(0, 0)
		$Path2D/PathFollow2D/Enemy.queue_free()

func _on_Player_hit():
	if $Shot.characterShoot == "player":
		print("Ignoring collision...")
	else:
		print("player hit")
		$Shot.hide()
		$Shot.position = Vector2(0, 0)
		$Player.queue_free()
