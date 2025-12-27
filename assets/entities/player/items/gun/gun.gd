extends CharacterBody2D

var bullet_path = preload("res://assets/entities/player/items/gun/bullets.tscn")

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		fire()
		
func fire():
	var enemies = get_tree().get_nodes_in_group("enemies")
	if enemies.is_empty():
		return
	
	var enemy = enemies[0] as Node2D
	var sprite := enemy.get_node("Sprite") as Node2D
	
	if enemies.size() > 0:
		look_at(sprite.global_position)
		
	var bullet = bullet_path.instantiate()
	bullet.pos = $Node2D.global_position
	bullet.rota = global_rotation
	bullet.dir = global_rotation
	get_parent().add_child(bullet)
