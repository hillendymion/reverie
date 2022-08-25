extends Area2D


export var Exit = "res://Objects/Rooms/LVL_Hub_Spoke.tscn"
export var Enter = ""


func _on_Exit_Room_body_entered(body: Node) -> void:
	print("DoorConnect: ", Enter)
	Player_Stats.Door_Name = Enter
	get_tree().change_scene(Exit)
