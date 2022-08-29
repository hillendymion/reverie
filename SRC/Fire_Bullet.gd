extends Area2D
#flaming bullets
export var element = "Fire"
export (int) var DamMod = 2
export var vel = Vector2.ZERO
export (int) var spd = 300
#var direction = Vector2.ZERO



func _on_Fire_Bullet_area_entered(area: Area2D) -> void:
	#collision.
	pass # Replace with function body.

func set_dir(direction):
	self.direction = direction
	rotation += direction.angle()
