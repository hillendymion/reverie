extends Node2D
#Enter1, Enter2
onready var stats = Player_Stats
onready var bulletManager = BulletManager
onready var player = $Plyr #?
export(String, FILE, "*.ogg") var song #this needs to be an object.

func _ready() -> void:
	#I should check if its a valid song.
	if song:
		print(str(song))
		Player_Stats.newsong(song) #or song != null
	#It might be better to emit a signal, but damn If I can wrap my head around that.
	if player:
		player.connect("Player_Bullet_Fired", bulletManager, "handle_bullet_Spawned")
	
	
	print(stats.Door_Name)
	if stats.Door_Name:
		var enter_node = find_node(stats.Door_Name)
		if enter_node:
			$Plyr.global_position = enter_node.global_position
			$Cam2D.global_position = $Plyr.global_position
			#trying this with position2d
