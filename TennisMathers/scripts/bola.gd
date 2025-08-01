extends RigidBody2D
var start_x := 0.0
var start_y := 0.0
var a := -0.002  # Coeficiente da parábola (ajuste conforme necessário)
var b := 0.0
var c := 0.0
var launched := false
var cont:=0
var x:=-1.0

func _ready():
	sleeping = true  # Bola começa "adormecida"

func launch():
	start_x = global_position.x
	start_y = global_position.y
	linear_velocity = Vector2(400, 0)  # velocidade inicial no eixo X
	gravity_scale = 0
	launched = true
	sleeping = false

func _physics_process(delta):
	if launched:
		#print(abs(global_position.x - start_x))
		var y = (pow(x, 2))
		
		print("x:", x)
		print("y",position.y)
		
		
		position.y = start_y-y
		x+=0.1
