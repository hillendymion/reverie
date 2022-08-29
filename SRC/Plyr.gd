extends KinematicBody2D
#Set up vars. 
var stats = Player_Stats #Be sure this name connects with the name given in the Autoload

#These stats make more sense in here for now.
var vel = Vector2.ZERO
var ACCEL = 400
var FRICTION = 380
var WALK_SPD = stats.Walk_Spd
var RUN_SPD = stats.Walk_Spd * 2 #TBD
var rate = stats.getRate() #connect dammit.
#var attack = stats.getAtt()
var fireready = true
var IsRunning = false
var obtain = null
var nearNPC = false

onready var Hurtbox = $Hurtbox

onready var Anim_Player = $AnimationPlayer
onready var ATree = $AnimationTree
onready var AnimationState = ATree.get("parameters/playback")

onready var cooldown = $Cooldown #triggers based on rate.
onready var hurtbox = $Hurtbox
onready var P_Target = $Talkbox/P_Target
onready var TalkBox = $Talkbox
onready var InteractBuffer = $InteractBuffer

const MENU = preload("res://Objects/Main_Menu.tscn")
const MWin = preload("res://Objects/UI/MWindow.tscn")
 #do this for each 'bullet'
const waterbullet = preload("res://Objects/Bullets/WaterBullet.tscn")
const FireBullet = preload("res://Objects/Bullets/Fire_Bullet.tscn")
const ArrowBullet = preload("res://Objects/Bullets/WaterBullet.tscn") #replace with actual bullet
const CandyBullet = preload("res://Objects/Bullets/WaterBullet.tscn") #replace with actual bullet
const WindBullet = preload("res://Objects/Bullets/WaterBullet.tscn") #replace with actual bullet
#const SND_PlyrHurt = preload("res://Object/SND_PlayerHurt.tscn")

#separation of concerns
signal Player_Bullet_Fired(bullet, pos, direction)


func _ready() -> void:
	Player_Stats.connect("no_HP",self,"queue_free")
	ATree.active = true
	P_Target.position.x = self.position.x
	P_Target.position.y = self.position.y
	#Anim_Player.play("Stand_D")

func _process(delta: float) -> void:
	Move_State(delta) #in case any tree states.
	#if cooldown.time_left > 0:
	#	print(cooldown.time_left)

func Move_State(delta):
	#movement here
	var inputVector = Vector2.ZERO
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputVector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	inputVector = inputVector.normalized()
	#normalized clips the diagonal so all directions move at the same speed.
	
	if inputVector != Vector2.ZERO:
		#if moving.
		ATree.set("parameters/Standing/blend_position", inputVector) #Do I really set them here?
		ATree.set("parameters/Walking/blend_position",  inputVector) #ATree.set("parameters/Walking/blend_position", inputVector)
		AnimationState.travel("Walking")
		if IsRunning == true:
			vel = vel.move_toward(inputVector*RUN_SPD, ACCEL*delta)
		else:
			vel = vel.move_toward(inputVector*WALK_SPD, ACCEL*delta)
		#print(inputVector, " Run: ",IsRunning)
		#print("plyrXy: ",floor(self.position.x), " ", floor(self.position.y), "Ptarget: ", floor(P_Target.global_position.x), " Y: ", floor(P_Target.global_position.y))
		#print("vel: "+str(vel))
	else:
		AnimationState.travel("Standing")
		vel = vel.move_toward(Vector2.ZERO, FRICTION*delta)
	move(delta)
	
	if Input.is_action_pressed("ui_shoot"):
		#just testing for now.
		#Might use this to fire a shot.
		if nearNPC == false:
			$ShootBuffer.start(.02)
		else:
			if stats.mwinDelay:
				get_item(stats.Item_get)
				var mwin = MWin.instance() #im not sure I need to var it. but sure.
				get_parent().add_child(mwin)
				stats.mwinDelay = false
				InteractBuffer.start(.5)
	if !$ShootBuffer.is_stopped():
		#print($ShootBuffer.time_left) #debug stuff.
		shoot()


		
	if Input.is_action_pressed("ui_cancel"):
		#not sure if this is the best key for this.
		IsRunning = true
	if Input.is_action_just_released("ui_cancel"):
		IsRunning = false


		
		
func move(delta):
	vel = move_and_slide(vel) #saving vel as value so as to read the previous val.
	
func shoot():
	if fireready == true:
		print("fire")
		var bullet = null
		fireready = false
		$ShootBuffer.stop()
		cooldown.start(10/stats.Rate) #not sure if I should just use rate here, or grab it dirctly from the other.
		#get correct bullet. Surely theres a better way to do this.
		if stats.Weapon == "waterbullet":
			bullet = waterbullet.instance() 
		elif stats.Weapon == "FireBullet":
			bullet = FireBullet.instance();
		elif stats.Weapon == "ArrowBullet":
			bullet = ArrowBullet.instance(); #replace with bulet as they are made.
		elif stats.Weapon == "CandyBullet":
			bullet = CandyBullet.instance();
		elif stats.Weapon == "WindBullet": #spread
			bullet = WindBullet.instance();
		#adds instance of bullet.
		
		#bullet.rotation_degrees = rotation_degrees #trying this.
		var bullet_Vel = P_Target.global_position - self.global_position
		emit_signal("Player_Bullet_Fired", bullet, P_Target, bullet_Vel)
		#call deffered?
		#For some reason Y_Sort offsets this really badly.

	
func menu():
	#activates menu TBD
	print("Menu On")
	var menu = MENU.instance()
	 #adds instance of menu.
	get_parent().add_child(menu)

func _on_Cooldown_timeout() -> void:
	#Cooldown Timer hits Zero.
	fireready = true
	cooldown.stop()
	print("fire ready")


func _on_Hurtbox_area_entered(area: Area2D) -> void:
	#enemy object hits player. ouch.
	stats.HP -= 1 #(replace with enemy attack- stats.defense)
	pass # Replace with function body.



func _on_Talkbox_area_entered(area: Area2D) -> void:
	#NPC enters talkbox area. 
	print("npc here")
	nearNPC = true
 

	
func get_item(item):
	#create for loop = PlayerStats.Weapons.length
	#just trying to see if theres a match in the weapons dictionary.
	if item != "" or item != null:
		var key = Player_Stats.Weapons.keys()
		print(key)
		for i in stats.Weapons: #how to find number in indexes in dictionary?
			if i == item: #invalid index my ass. okay, so i itself will return the key. weird.
				stats.Weapons[i] = true
		#okay, need to find the index, and set its value to true.


func _on_Talkbox_area_exited(area: Area2D) -> void:
	nearNPC = false


func _unhandled_input(event: InputEvent) -> void:
	#called once per event. I had no idea this event existed.
		if Input.is_action_pressed("ui_menu"):
		#just testing for now.
		#Might use this to fire a shot.stat
			menu()
		if Input.is_action_just_released("ui_toggle"): 
		#Check if any in the stats. weapons dictionary is true.
		#get stats.Weapon. compare it to the Stats.weapon dictionary. Then Ge to the next one up the list (if true).
			pass

	
