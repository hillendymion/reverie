extends Area2D
export var element = "Wind" #Fire, Ice, Wind, None
export var DamMod = 2
export var vel = Vector2.ZERO
export var spd = 200

func _ready() -> void:
	$AnimatedSprite.play("default")
	$Timer.start(2)

func _on_Timer_timeout() -> void:
	queue_free()


func set_dir(direction):
	#connected and passed through the bullet manager
	self.direction = direction
	rotation += direction.angle()
	#rotation_degrees?
