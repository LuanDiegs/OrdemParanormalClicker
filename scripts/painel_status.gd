extends Control

func _ready():
	Globais.atualizaLabelPrecoSubirDeNivel()
	Globais.atualizaStatusZumbisDeSangue()
	Globais.atualizaLabelPrecoCooldownInimigos()
	
func _process(delta):
	pass

func _on_aumento_dano_pressed():
	comprarAtualizacaoAumentoDano(Globais.precoSubirDanoJogador)

func comprarAtualizacaoAumentoDano(preco):
	if Globais.zumbisDeSangueMortos >= preco:
		Globais.diminuiZumbiDeSangueMortos(preco)
		Globais.somaPrecoAumentoDeDano()
		Globais.atualizaStatusZumbisDeSangue()
		Globais.atualizaLabelPrecoSubirDeNivel()
		Globais.somaDanoJogador()

func comprarAtualizacaoDiminuirCooldown(preco):
	if Globais.zumbisDeSangueMortos >= preco:
		Globais.diminuiZumbiDeSangueMortos(preco)
		Globais.somaPrecoDiminuirCooldown()
		Globais.atualizaStatusZumbisDeSangue()
		Globais.atualizaLabelPrecoCooldownInimigos()
		Globais.diminuiTempoRespawnInimigos()

func _on_diminuir_cooldown_pressed():
	comprarAtualizacaoDiminuirCooldown(Globais.precoDiminuirCooldownRespawnInimigos)
