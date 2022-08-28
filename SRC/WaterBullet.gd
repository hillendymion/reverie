extends KinematicBody2D
#get direction of player.
#fire bullet in that direction.
export var spd = 300
var vel = Vector2(0,0) #direction.
var direction = Vector2.ZERO #trying different things here.
var adir = "Squirt_D"

var Impact = preload("res://Objects/Bullets/Effect_Splish.tscn")
onready var hitbox = $Area2D/hitbox
onready var Anim_plyr = $AnimationPlayer
onready var AnimTree = $AnimationTree
#export var boom = preload("res://Object/Effect.tscn") #TBD

func _ready() -> void:
	#play aimation based on vel direction. maybe use an array?
	print("waterBullet: "+adir+ " dir: "+str(vel))#vel stays at zero?
	Anim_plyr.play(adir)
	#Anim_plyr.play(adir) # Replace with function body.


func _physics_process(delta: float) -> void:
	var collision_info = move_and_collide(vel.normalized() * delta * spd)
	AnimTree.set("parameters/B/blend_position", collision_info)
	#print("vel: "+str(vel))
	Anim_plyr.play(adir)
	
	
	
func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	#for water bulet only.
	queue_free()


func _on_Hitbox_area_entered(area: Area2D) -> void:
	#hits something
	var impact = Impact.instance()
	impact.position = self.global_position
	queue_free()

func set_dir(direction):
	pass
