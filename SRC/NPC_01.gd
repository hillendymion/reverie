extends KinematicBody2D

onready var sprite = $Sprite
onready var Talkarea = $TalkArea
export var dialogue = "hello world."


func _on_TalkArea_body_entered(body: Node) -> void:
	#activates interaction with character.
	#I really want a position entered listener.
	pass # Replace with function body.
