extends Node2D

const inimigo = preload("res://cenas/personagens/zumbi_de_sangue.tscn")

func _ready():
	%TempoGeracao.wait_time = Globais.tempoCooldownRespawnInimigos

func _process(delta):
	pass
	
func geraInimigos():
	var novoInimigo = inimigo.instantiate()
	%GeracaoInimigos.progress_ratio = randf()
	novoInimigo.global_position = %GeracaoInimigos.global_position
	add_child(novoInimigo)

func _on_tempo_geracao_timeout():
	geraInimigos()
