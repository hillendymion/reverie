extends Node2D

func handle_bullet_Spawned(bullet, pos, direction):
	print("Bullet Spawn Called. that works.")
	add_child(bullet)
	bullet.position = pos.global_position #this is awkward
	bullet.vel = direction
	#the bullet needs to face the direction right too.
	bullet.set_dir(direction)#set direction. Every bullet should have this.


func handle_hp_hitspawn(hit_amount, pos):
	#Create an HP Hit piece that generates when enemy or player gets hit. 
	pass
