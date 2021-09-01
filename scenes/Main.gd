extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.start($PlayerStart.position)
	$Enemy.start($EnemyStart.position)

func _on_Player_playerShoot():
	$Shot.position = $Player.position
	$Shot.shoot("player")
	
	
