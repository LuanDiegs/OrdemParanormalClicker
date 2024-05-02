extends Sprite2D

var SpritesZumbisDeSangue: Array = [
	preload("res://src/imagens/zumbiSangue.webp"),
	preload("res://src/imagens/zumbiSangue1.webp"),
	preload("res://src/imagens/zumbiSangue2.webp"),
	preload("res://src/imagens/zumbiSangue3.webp"),
]

func _ready():
	escolheSprite()

func _process(delta):
	pass

func escolheSprite():
	if SpritesZumbisDeSangue.size() > 1:
		var texturaId = randi() % SpritesZumbisDeSangue.size()
		var texturaEscolhida = SpritesZumbisDeSangue[texturaId]
		texture = texturaEscolhida
