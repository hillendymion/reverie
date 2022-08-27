extends Area2D


func _on_Area2D_body_entered(body: Node) -> void:
	Player_Stats.Coins +=1
	queue_free()
	pass # Replace with function body.
