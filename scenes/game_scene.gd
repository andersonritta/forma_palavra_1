extends Node2D

var palavras = [
	{"imagem": "res://assets/imgs/cards/imagem_bala.webp", "palavra": "BALA"},
	{"imagem": "res://assets/imgs/cards/imagem_boca.webp", "palavra": "BOCA"},
	{"imagem": "res://assets/imgs/cards/imagem_bola.webp", "palavra": "BOLA"},
	{"imagem": "res://assets/imgs/cards/imagem_bolo.webp", "palavra": "BOLO"},
	{"imagem": "res://assets/imgs/cards/imagem_bone.webp", "palavra": "BONÉ"},
	{"imagem": "res://assets/imgs/cards/imagem_bota.webp", "palavra": "BOTA"},
	{"imagem": "res://assets/imgs/cards/imagem_casa.webp", "palavra": "CASA"},
	{"imagem": "res://assets/imgs/cards/imagem_copo.webp", "palavra": "COPO"},
	{"imagem": "res://assets/imgs/cards/imagem_dado.webp", "palavra": "DADO"},
	{"imagem": "res://assets/imgs/cards/imagem_faca.webp", "palavra": "FACA"},
	{"imagem": "res://assets/imgs/cards/imagem_foca.webp", "palavra": "FOCA"},
	{"imagem": "res://assets/imgs/cards/imagem_fogo.webp", "palavra": "FOGO"},
	{"imagem": "res://assets/imgs/cards/imagem_lata.webp", "palavra": "LATA"},
	{"imagem": "res://assets/imgs/cards/imagem_leao.webp", "palavra": "LEÃO"},
	{"imagem": "res://assets/imgs/cards/imagem_lixo.webp", "palavra": "LIXO"},
	{"imagem": "res://assets/imgs/cards/imagem_lobo.webp", "palavra": "LOBO"},
	{"imagem": "res://assets/imgs/cards/imagem_luva.webp", "palavra": "LUVA"},
	{"imagem": "res://assets/imgs/cards/imagem_mala.webp", "palavra": "MALA"},
	{"imagem": "res://assets/imgs/cards/imagem_meia.webp", "palavra": "MEIA"},
	{"imagem": "res://assets/imgs/cards/imagem_mola.webp", "palavra": "MOLA"},
	{"imagem": "res://assets/imgs/cards/imagem_olho.webp", "palavra": "OLHO"},
	{"imagem": "res://assets/imgs/cards/imagem_osso.webp", "palavra": "OSSO"},
	{"imagem": "res://assets/imgs/cards/imagem_pato.webp", "palavra": "PATO"},
	{"imagem": "res://assets/imgs/cards/imagem_pipa.webp", "palavra": "PIPA"},
	{"imagem": "res://assets/imgs/cards/imagem_roda.webp", "palavra": "RODA"},
	{"imagem": "res://assets/imgs/cards/imagem_sapo.webp", "palavra": "SAPO"},
	{"imagem": "res://assets/imgs/cards/imagem_urso.webp", "palavra": "URSO"},
	{"imagem": "res://assets/imgs/cards/imagem_vaca.webp", "palavra": "VACA"}
]

func carregar_imagens():
	palavras.shuffle()
	var selecionadas = palavras.slice(0, 4)
	
	for i in range(4):
		var imagem_node = $FrameImagem.get_node("FrameImagem" + str(i + 1))
		imagem_node.texture = load(selecionadas[i]["imagem"])
	
	embaralha(selecionadas)

func mostrar_letras(selecionadas):
	var letras = []
	for selecionada in selecionadas:
		letras.append_array(selecionada["palavra"].split(""))

	for i in range(16):
		var grid = "FrameVazio" + str(i + 1)
		var frame_vazio = get_node(grid)
		var label = frame_vazio.get_node("Label")  

		if i < len(letras):
			label.text = letras[i]

		else:
			label.text = ""

func embaralha(selecionadas):
	var letras = []

	for selecionada in selecionadas:
		letras.append_array(selecionada["palavra"].split(""))

	letras.shuffle()

	for i in range(16):
		var gridLetras = "FrameLetras" + str(i + 1)
		var frame_letras = get_node(gridLetras)
		var labelLetras = frame_letras.get_node("Label") 

		labelLetras.text = letras[i]

func _ready():
	carregar_imagens()


func _on_options_pressed():
	pass


func _on_menu_pressed() -> void:
	pass
