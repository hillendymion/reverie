extends CanvasLayer

onready var HPStats = $HPStats
onready var ViewWeapon = $Vweap

onready var BossMeterFire = $Boss_MeterFire
onready var BossHPFire = $Boss_MeterFire/BMFull
onready var BossMeterIce = $Boss_MeterIce
onready var BossHPIce = $Boss_MeterIce/BMFull
onready var RateM = $RateM
onready var stats = Player_Stats

func ready():
	RateM.visible = false
	BossMeterFire.visible = false
	BossMeterIce.visible = false
	
func _physics_process(delta: float) -> void:
	HPStats.text = "HP: "+ str(stats.HP)+"/"+str(stats.MaxHP)
	ViewWeapon.text = "Weapon: "+stats.Weapon
	#replace with the images.
	if find_node("res://Objects/Plyr.tscn"):
		RateM.visible = true
		#refills ad the cooldown timer hits. ee the rate.
	if find_node("res://Objects/Enemies/En_Boss_Demon1.tscn"):
		BossMeterFire.visible = true
	if find_node("res://Objects/Enemies/En_Boss_Demon_Ice.tscn"):
		BossMeterIce.visible = true
		
func meters(rfillstart, rfilllength, rfillend, val, totalval):	
	#get rectfill, stasrtpoint end point, total val, current  val 
	pass
	#filll meters
	
