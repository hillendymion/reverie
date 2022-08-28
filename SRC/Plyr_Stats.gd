extends Node2D
#This is a persistant global variable holder. 
#Contans player stats, dialogue, entrance settings. and other things talked between nodes.

var HP = 8 setget changeHP, getHP
var MaxHP = 8
var Walk_Spd = 130 setget setWalkSpd, getWalkSpd
var Attack = 2 setget setAtt, getAtt
var Defense = 1 setget setDef, getDef
var Rate = 5 setget setRate, getRate #fire speed mayb I should apply this fractionally?
var Weapon = "waterbullet" #Active Weapon.

#trying this with a dictionary.
var Weapons = {"Arrow": false, "waterbullet": false, "Firebullet": false, "WindBullet":false, "InkBullet":false} setget setWeapons, getWeapons

var Coins = 0 setget setCoins, getCoins
#For doors
var Door_Name = null setget setDoor, getDoor
#For dialoge
var Dialoguetext = "" setget setDialog, getDialog#Its an array. Pulled from a json file.
var mwinDelay = true setget setmwindelay
#can arrays be export varabled?
var Item_get = ""

#BossHP
var Boss_FireHP = 800 setget setFireBossHP, getFireBossHP
var Boss_IceHP = 1000 setget setIceBossHP, getIceBossHP


#Setter getters.
func changeHP(val):
	HP = min(val, MaxHP)
	#maybe emit  signal for changing
	if HP <= 0:
		emit_signal("no_HP")
		Game_Over()
func getHP():
	return HP
func setAtt(val):
	Attack = int(val)
func getAtt():
	return Attack
func setDef(val):
	Defense = int(val)
func getDef():
	return Defense
func setWalkSpd(val):
	Walk_Spd = val
func getWalkSpd():
	return Walk_Spd
func setRate(val):
	Rate = int(val) #right now lower rate means faster. Should revamp this. maybe with a fraction
func getRate():
	return Rate
func setCoins(val):
	Coins = int(min(val, 999)) #arbitrary for now.
	if Coins < 0: Coins = 0
func getCoins():
	return(Coins)
func setWeapons(val):
	#setting this up to avoid invalid indexes.
	Weapons = val
func getWeapons():
	return Weapons
func setmwindelay(val):
	mwinDelay = val

#Doors. This sets the position of the player when entering a scene/level.
func setDoor(val):
	#For now, just set if at Eter1, Enter2, Enter3, etc.
	Door_Name = val
func getDoor():
	return Door_Name
func setDialog(val):
	Dialoguetext = val
func getDialog():
	return Dialoguetext

func setIceBossHP(val):
	Boss_IceHP = val
	if Boss_IceHP <= 0:
		emit_signal("IceBossDead")#not sure what I'll use this for, but might be useful for flags.
func getIceBossHP():
	return Boss_IceHP
func setFireBossHP(val):
	Boss_FireHP = val
	if Boss_FireHP <= 0:
		emit_signal("FireBossDead")#not sure what I'll use this for, but might be useful for flags.
func getFireBossHP():
	return Boss_FireHP
#Signals. 
signal no_HP
signal IceBossDead
signal FireBossDead

func Game_Over():
	#move character to bedroom.
	Door_Name = "Enter3"
	get_tree().change_scene("res://Objects/Rooms/LVL_Hub.tscn") #for now
