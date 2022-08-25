extends Node2D


var HP = 8 setget changeHP, getHP
var MaxHP = 8
var Walk_Spd = 130 setget setWalkSpd, getWalkSpd
var Attack = 2 setget setAtt, getAtt
var Defense = 1 setget setDef, getDef
var Rate = 5 setget setRate, getRate #fire speed mayb I should apply this fractionally?
var Weapon = "waterbullet" #Will have to get a list of these.

#For doors
var Door_Name = null setget setDoor, getDoor

#BossHP
var Boss_FireHP = 800 setget setFireBossHP, getFireBossHP
var Boss_IceHP = 1000 setget setIceBossHP, getIceBossHP

#Setter getters.
func changeHP(val):
	HP = val
	if HP > MaxHP:
		HP = MaxHP
	elif HP <= 0:
		emit_signal("no_HP")
		Game_Over()
func getHP():
	return HP
func setAtt(val):
	Attack = val
func getAtt():
	return Attack
func setDef(val):
	Defense = val
func getDef():
	return Defense
func setWalkSpd(val):
	Walk_Spd = val
func getWalkSpd():
	return Walk_Spd
func getRate():
	return Rate
func setRate(val):
	Rate = val

#Doors. 
func setDoor(val):
	#For now, just set if at Eter1, Enter2, Enter3, etc.
	Door_Name = val
func getDoor():
	return Door_Name


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
	pass
