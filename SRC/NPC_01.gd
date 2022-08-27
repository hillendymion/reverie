extends KinematicBody2D


onready var sprite = $Sprite
onready var Talkarea = $TalkArea
onready var stats = Player_Stats
export var dialoguepath = "res://Dialog/NPC_Bala1.json" #default
export var obtain = "waterbullet" #will handle obtaining items


func ready():
	pass


func _on_TalkArea_body_entered(body: Node) -> void:
	Player_Stats.Item_get = obtain
	Player_Stats.Dialoguetext = dialoguepath
	#I really want a position entered listener.

	#if val == PlayerStats.Weapons[i]: 
		#PlayerStats.Weapons_Available[i] = true.
	print(Player_Stats.Dialoguetext)
	print(Player_Stats.Item_get)
	pass
