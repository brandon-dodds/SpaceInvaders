extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.start($PlayerStart.position)
	$Enemy.start($EnemyStart.position)

func _on_Player_playerShoot():
	if $Shot.shotOnScreen == false:
		$Shot.shotOnScreen = true
		$Shot.position = $Player.position
		$Shot.shoot("player")
	
	


func _on_Enemy_hit():
	$Shot.hide()
	$Shot.position = Vector2(0, 0)
