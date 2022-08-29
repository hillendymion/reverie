extends Node2D
#created when connecting with enemy or wall.
func _ready() -> void:
	$AnimatedSprite.play("default")

func _on_AnimatedSprite_animation_finished() -> void:
	queue_free()
	
