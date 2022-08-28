extends Control

onready var showEquip = $CanvasLayer/NinePatchRect/Equip

onready var showHP = $CanvasLayer/showstats/ShowHP
onready var showAtt = $CanvasLayer/showstats/ShowAttack
onready var showDef = $CanvasLayer/showstats/ShowDef
onready var showRate = $CanvasLayer/showstats/showRate
onready var showSpd = $CanvasLayer/showstats/ShowSpd
onready var showCoins = $CanvasLayer/showstats/ShowCoins

onready var Arrow = $CanvasLayer/SelectArrow
var slotstartx = 16
var arrowspace = 20
var hstart = 96
var vstart = 64
var hslot = 0
var vslot = 0
var hslots = 7
var vslots = 2
var stats = Player_Stats

func _ready() -> void:
	#set process function to false(pauses game.)
	get_tree().paused = true #pause variable.

func _physics_process(delta: float) -> void:
	
	DisplayStats()
	
	if Input.is_action_just_released("ui_exit_menu"):
		#just testing for now.
		#Might use this to fire a shot.
		get_tree().paused = false
		exit_menu()
	
	#obviously will confine itself to the options when implemented.
	if Input.is_action_just_released("ui_down"):
		if vslot > vslots: vslot = 0
		else: vslot +=1
	if Input.is_action_just_released("ui_up"):
		if vslot < 1 : vslot = vslots+1
		else: vslot -=1
	if Input.is_action_just_released("ui_left"):
		if hslot < 1: hslot = hslots+1
		else: hslot -=1
	if Input.is_action_just_released("ui_right"):
		if hslot > hslots: hslot = 0
		else: hslot +=1		
	Arrow.position.y = vstart+arrowspace*vslot
	Arrow.position.x = hstart+arrowspace*hslot
	
func exit_menu():
	#set cuntion process to true.
	queue_free()

func DisplayStats():
	#var stats = "", stats.hp
	var def = stats.Defense
	var rate = stats.Rate
	var spd = stats.Walk_Spd
	var coins = stats.Coins
	
	showHP.text = "HP: "+str(stats.HP)+"/"+str(stats.MaxHP)
	showAtt.text = "Att: "+str(stats.Attack)
	showDef.text = "Def: "+str(stats.Defense)
	showSpd.text = "Spd: "+str(stats.getDef())
	showRate.text = "Rte: "+str(stats.getRate())
	showCoins.text = "Coin: "+str(stats.getCoins())
	#For the equip menu
	showEquip.text = "Equip:"+str(stats.Weapon)
	
