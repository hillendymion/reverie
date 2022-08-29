extends Area2D

export var element = "None" #Fire, Ice, Wind, None
export var DamMod = 1
export var vel = Vector2.ZERO
export var spd = 300




func set_dir(direction):
	#connected and passed through the bullet manager
	self.direction = direction
	rotation += direction.angle()
	#rotation_degrees?
