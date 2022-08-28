extends Control
	#get 
onready var text = $Text #RihTextLabel is new to me.
onready var namae = $Namae #NPC name. namae makes it unique 
onready var adown = $Adown
onready var timer = $Timer
onready var buffer = $buffer
onready var audio = $AudioStreamPlayer
export(float) var textspeed = 0.05 
onready var dialoguepath = Player_Stats.Dialoguetext #I could totally gab this from the npc and chain it from them.
#this was just an eport variable. 
var dialog
var phrasenum = 0
var done = false #finished

func _ready() -> void:
	print("mwin created"+ str(Player_Stats.Dialoguetext))
	timer.wait_time = textspeed
	get_tree().paused = true
	dialog = getDialog()
	#assert(dialog, "dialog missing")
	print("From Mwin: "+str(dialog))
	nextPhrase()
	#textData = Player_Stats.DialogueText[0]
	#convert json file on to readible.

func _physics_process(delta: float) -> void:
	adown.visible = done
	
	if Input.is_action_just_pressed("ui_exit_menu") or Input.is_action_just_pressed("ui_shoot"):

		#pagenum will be an index for multiple boes of text. for now its just a check for this
		if done:
			nextPhrase()
		else:
			text.visible_characters = len(text.text)
			print("skipped")
	#I seem to have an issue where I interact and reopen the dialoige path that I close.
	
func getDialog() -> Array:
	#lots of new bits I'm just learning about here.
	var f = File.new()
	assert(f.file_exists(dialoguepath), "Check that dialogue path again!")
	f.open(dialoguepath, File.READ)
	var json = f.get_as_text()
	var output = parse_json(json)
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []
		
func nextPhrase():
	if phrasenum >= len(dialog):
		get_tree().paused = false
		self.visible = false
		buffer.start() #timer is a buffer so the mwin doesn immediately restart.
		return
		
	done = false
	namae.bbcode_text = dialog[phrasenum]["Name"] #invalid set index ;bbcode_text;
	text.bbcode_text = dialog[phrasenum]["Text"]	
	#bbcode  doesn't read the bbcode tags as text.
	text.visible_characters = 0
	if !dialog[phrasenum]["Audio"]:
		if dialog[phrasenum]["Audio"] == "pickup":
			audio.play()
	
	while text.visible_characters < len(text.text):
		#scary ambiguity
		text.visible_characters+=1
		timer.start()
		yield(timer,"timeout") #stops time utnil it spits out the timeout signal
	done = true
	phrasenum += 1
	return
	
		

func _Buffer_timeout() -> void:
	kill_mwin()
	
func kill_mwin():
	#get_tree().paused = false
	Player_Stats.mwinDelay = true
	print("new: ", Player_Stats.Weapons)
	queue_free()
