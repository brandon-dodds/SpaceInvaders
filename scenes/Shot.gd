extends Area2D

var characterShoot
var shotOnScreen = false
signal playerHit
export var speed = 400
# Called when the node enters the scene tree for the first time.

func init(playerShot):
	characterShoot = playerShot

func _process(delta):
	var velocity = Vector2()
	if characterShoot == "player":
		velocity.y -= 1
	elif characterShoot == "enemy":
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Shot_area_entered(area):
	if area.is_in_group("player") and characterShoot == "player":
		print("ignoring collision")
	if area.is_in_group("player") and characterShoot != "player":
		emit_signal("playerHit")
		queue_free()
	if area.is_in_group("enemy") and characterShoot == "enemy":
		print("ignoring collision")
	if area.is_in_group("enemy") and characterShoot != "enemy":
		emit_signal("enemyHit")
		queue_free()
