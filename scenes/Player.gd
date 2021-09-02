extends Area2D

export var speed = 400
var screen_size

signal playerShoot
signal hit
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		emit_signal("playerShoot")
	if velocity.length() > 0: 
		velocity = velocity.normalized() * speed
	position += velocity * delta
	position.x = clamp(position.x, screen_size.x / 4, 3 * screen_size.x /4)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _on_Player_area_entered(_area):
	emit_signal("hit")
