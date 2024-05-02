extends CharacterBody2D

@onready var cooldown_ataque = $CooldownAtaque
@onready var area_de_observacao = $AreaDeObservacao

var primeiroInimigo: CharacterBody2D
var posicaoInicial
var velocidade = 1000
var bateu = false

func _ready():
	posicaoInicial = global_position
	
func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 0.1
	
	move_and_slide()
	var inimigosEmVolta = area_de_observacao.get_overlapping_bodies()
	
	if inimigosEmVolta.size() > 0:
		primeiroInimigo = inimigosEmVolta.front() as CharacterBody2D
		
	if(!bateu and primeiroInimigo != null):
		var direcao = global_position.direction_to(primeiroInimigo.global_position)
		velocity = direcao * velocidade	
		move_and_slide()
		
	if(bateu and global_position > posicaoInicial):
		retornaPontoInicial()
		move_and_slide()

func _on_cooldown_ataque_timeout():
	bateu = false
	primeiroInimigo = null
	cooldown_ataque.stop()
		
func retornaPontoInicial():
	var direcao = global_position.direction_to(posicaoInicial)
	velocity = direcao * velocidade

func _on_area_hit_body_entered(body):
	bateu = true
	cooldown_ataque.start()
