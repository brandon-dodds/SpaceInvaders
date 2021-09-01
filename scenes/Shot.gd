extends Area2D

var characterShoot
var shotOnScreen = false
export var speed = 400
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func _process(delta):
	var velocity = Vector2()
	if characterShoot == "player":
		velocity.y -= 1
	elif characterShoot == "enemy":
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	
func shoot(character):
	show()
	characterShoot = character

func _on_VisibilityNotifier2D_screen_exited():
	shotOnScreen = false
