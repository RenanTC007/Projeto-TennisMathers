extends CharacterBody2D


const SPEED = 300.0
var JUMP_VELOCITY = -400.0
var is_tocando : bool = false
var cont: int = 0
var x



#@onready var ballon = get_node("res://bola.tscn")
@onready var animation := $AnimatedSprite2D
@onready var animator := $AnimationPlayer
var direction

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("pulo_p1") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	direction = Input.get_axis("mover_esq", "mover_dir")
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
		
	if Input.is_action_just_pressed("toque_baixo1"):
		is_tocando = true
	
	handle_animation()
	move_and_slide()
	

func handle_animation():
	var anim = "parado"
	
	if direction and is_on_floor():
		anim = "andando"
	
	if is_tocando:
		anim = "toque"
	
	if animator.name != anim:
		animator.play(anim)
	

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "toque":
		is_tocando = false


func _on_hit_box_body_entered(body: Node2D) -> void:
	if body.is_in_group("bola"):
		body.launch() 
		
		
	
		#if body.has_method("apply_central_impulse"):
			#body.apply_central_impulse(Vector2(0.4, -0.4))
#func _anda_bola(delta: float, body) -> void:
	#print("porra")
	#print(delta)
	#x = body.position.x
	#body.position.y = -x*x
	
