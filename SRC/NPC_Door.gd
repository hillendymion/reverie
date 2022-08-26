extends KinematicBody2D

onready var animPlyr = $AnimationPlayer
onready var OpenC = $Open
#export(PackedScene) var Exit
export(String, FILE, "*.tscn, *.scn") var Exit 
export(String) var Entrance
#theres got to be a less clunky way to do this.



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_shoot"):
		if OpenC.get_overlapping_bodies().size() > 0:
			if Entrance:
				Player_Stats.Door_Name = Entrance
			else:
				Player_Stats.Door_Name = "Enter1" #defaults just in case
			animPlyr.play("Open")

func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if !Exit:
		print("No Scene Placed")	
	else:
		var Error = get_tree().change_scene(Exit) #I'm not sure the difference between change scene, and change scene to.
		if Error != OK:
			print("something went wrong. Door got borked")
		

func _on_NPC_Door_body_entered(body: Node) -> void:
	print("connected")

