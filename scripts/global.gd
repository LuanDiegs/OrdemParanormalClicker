extends Node

@onready var painel_status = get_tree().get_first_node_in_group("uiStatus")
@onready var jogo = get_tree().get_first_node_in_group("timerCooldownInimigos")

#Status
var zumbisDeSangueMortos = 0

#Estatísticas
var danoJogador = 1
var tempoCooldownRespawnInimigos = 2

#Preços
var precoDiminuirCooldownRespawnInimigos = 10
var precoSubirDanoJogador = 2

#Region: Status dos zumbis de sangue
func atualizaStatusZumbisDeSangue():
	painel_status.get_node("%TextoZumbisSangue").text = "Zumbis de sangue derrotados: " + str(zumbisDeSangueMortos)

func somaZumbiDeSangueMortos():
	zumbisDeSangueMortos += 1

func somaZumbiDeSangueMortosQuantidadePersonalizada(quantidade: int):
	zumbisDeSangueMortos += quantidade
	
func diminuiZumbiDeSangueMortos(valor):
	zumbisDeSangueMortos -= valor

#Region: Aumento de dano
func somaPrecoAumentoDeDano():
	precoSubirDanoJogador += round(precoSubirDanoJogador * 1)
	
func somaDanoJogador():
	danoJogador += 1

func atualizaLabelPrecoSubirDeNivel():
	painel_status.get_node("%PrecoSubirNivel").text = str(precoSubirDanoJogador)

#Region: Cooldown dos inimigos
func diminuiTempoRespawnInimigos():
	tempoCooldownRespawnInimigos -= 0.5
	jogo.get_node("%TempoGeracao").wait_time = tempoCooldownRespawnInimigos

func atualizaLabelPrecoCooldownInimigos():
	painel_status.get_node("%PrecoSubirNivelCooldown").text = str(precoDiminuirCooldownRespawnInimigos)
	print(precoDiminuirCooldownRespawnInimigos)
	
func somaPrecoDiminuirCooldown():
	precoDiminuirCooldownRespawnInimigos += round(precoDiminuirCooldownRespawnInimigos * 0.5)
