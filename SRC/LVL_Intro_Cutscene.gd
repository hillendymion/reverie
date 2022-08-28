extends Node2D
onready var animPlayer = $AnimationPlayer
export(String, FILE, "*.tscn, *.scn") var Exit 

func _ready() -> void:
	animPlayer.play("cutscene")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	get_tree().change_scene(Exit)
