extends CharacterBody2D

@onready var jogador = get_tree().get_first_node_in_group("jogador")
@onready var hitbox = $Hitbox
@onready var painel_status = get_tree().get_first_node_in_group("uiStatus")

signal zumbiDeSangueMorreu

const velocidade = 400
var tomouKnockback = false
var distanciaMaximaKnockback
var forcaKnockback = 2
var potenciaKnocback = 1.5
var vida = 2
var morreu = false

func _process(delta):
	var direcao
	if(!tomouKnockback):
		movimentaInimigo()
	else:
		desabilitaHitbox()
		if global_position >= distanciaMaximaKnockback:
			habilitaHitbox()
			tomouKnockback = false
	
	if morreu:
		desabilitaHitbox()
		$Area2D.disable_mode = PROCESS_MODE_DISABLED
		
	move_and_slide()

func _on_area_2d_body_entered(body):
	if !morreu:
		tomaDano()
		tomaKnockback()

func movimentaInimigo():
	var direcao = global_position.direction_to(jogador.global_position)
	velocity = direcao * velocidade
		
func tomaKnockback():
	var knockbackDirecao = -velocity
	velocity = knockbackDirecao * forcaKnockback

func tomaDano():
	if vida > 0:
		tomouKnockback = true
		distanciaMaximaKnockback = self.global_position * potenciaKnocback
		vida -= Globais.danoJogador
	
	if vida <= 0:
		morre()

func morre():
	morreu = true
	velocity = Vector2(0,0)
	$AnimationPlayer.play("morte")
	$TempoParaDesaparecer.start()
	Globais.somaZumbiDeSangueMortos()
	Globais.atualizaStatusZumbisDeSangue()

func _on_tempo_para_desaparecer_timeout():
	queue_free()
	
func desabilitaHitbox():
	$Hitbox.disabled = true
	
func habilitaHitbox():
	$Hitbox.disabled = false
