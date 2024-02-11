extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


#func walk, jump
func _physics_process(delta):
	#Add the gravity
	if not is_on_floor():
		velocity.y += gravity*delta
		
		
	#Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
		
	#Walk
	var direction = Input.get_axis("ui_left","ui_right")
	
	if direction:
		velocity.x = direction*SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	#call function	
	update_animation()
	move_and_slide()
	
func update_animation():	
	#Animetion run, idle
	if	velocity.x < 0 and is_on_floor():
		get_node("AnimatedSprite2D").play("run")
		#ให้วิ่งไปทางซ้ายเป็นจริง
		get_node("AnimatedSprite2D").set_flip_h(true)
	elif velocity.x > 0 and is_on_floor():
		get_node("AnimatedSprite2D").play("run")
		#ให้วิ่งไปทางซ้ายเป็นเท็จ ก็คือให้ไปทางขวา
		get_node("AnimatedSprite2D").set_flip_h(false)	
	elif (velocity.x == 0) and is_on_floor():
		#get_node("AnimatedSprite2D").play("jump")
		get_node("AnimatedSprite2D").play("idle")
	
	#animation jump can't play 
	#if (velocity.x == 0) and is_on_floor() :
		#get_node("AnimatedSprite2D").play("idle")  
	if velocity.y < 0 and not is_on_floor():
		get_node("AnimatedSprite2D").play("jump2")
	elif velocity.x < 0 and not is_on_floor():
		get_node("AnimatedSprite2D").play("jump2")
		get_node("AnimatedSprite2D").set_flip_h(true)
	elif velocity.x > 0 and not is_on_floor():
		get_node("AnimatedSprite2D").play("jump2")
		get_node("AnimatedSprite2D").set_flip_h(false)
		
func die():
	get_tree().reload_current_scene()

