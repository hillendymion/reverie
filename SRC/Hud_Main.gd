extends CanvasLayer

var toggle = true
onready var HPStats = $Control/HPStats
onready var ViewWeapon = $Control/Vweap

onready var BossMeterFire = $Control/Boss_MeterFire
onready var BossHPFire = $Control/Boss_MeterFire/BMFull
onready var RateM = $Control/RateM
onready var stats = Player_Stats

func ready():
	RateM.visible = false
	
func _physics_process(delta: float) -> void:
	HPStats.text = "HP: "+ str(stats.HP)+"/"+str(stats.MaxHP)
	ViewWeapon.text = "Weapon: "+stats.Weapon
	#replace with the images.
	if find_node("res://Objects/Plyr.tscn"):
		RateM.visible = true
		#refills ad the cooldown timer hits. ee the rate.
	#Its hacky, but hopefully it works.
	if get_tree().paused == true:
		self.visible = false
	else:
		self.visible = true
		
		
func meters(rfillstart, rfilllength, rfillend, val, totalval):	
	#get rectfill, stasrtpoint end point, total val, current  val 
	pass
	#filll meters
	
