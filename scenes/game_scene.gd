extends Node2D

# Lista de palavras e imagens
var palavras = [
	{"imagem": "res://assets/imgs/cards/imagem_bala.webp", "palavra": "BALA"},
	{"imagem": "res://assets/imgs/cards/imagem_boca.webp", "palavra": "BOCA"},
	{"imagem": "res://assets/imgs/cards/imagem_bola.webp", "palavra": "BOLA"},
	{"imagem": "res://assets/imgs/cards/imagem_bolo.webp", "palavra": "BOLO"},
	{"imagem": "res://assets/imgs/cards/imagem_bone.webp", "palavra": "BONE"},
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



# Função para carregar as imagens aleatórias
func carregar_imagens():
	palavras.shuffle()  # Embaralha as palavras
	var selecionadas = palavras.slice(0, 4)  # Pega as 4 primeiras palavras
	
	for i in range(4):
		# Acessa o nó FrameImagem correspondente dinamicamente
		var imagem_node = $FrameImagem.get_node("FrameImagem" + str(i + 1))
		imagem_node.texture = load(selecionadas[i]["imagem"])  # Atribui a textura da imagem
	
	# Exibe as letras correspondentes no GridContainer
	#mostrar_letras(selecionadas)
	embaralha(selecionadas)

# Função para exibir as letras no GridContainer
func mostrar_letras(selecionadas):
	# Cria uma lista de letras, mantendo a ordem das palavras
	var letras = []
	for selecionada in selecionadas:
		letras.append_array(selecionada["palavra"].split(""))  # Adiciona as letras da palavra na lista
	
	# Exibe as letras nos 16 espaços do GridContainer
	#var grid = $FramesVazios  # Acessa o GridContainer
	for i in range(16):
		var grid = "FrameVazio" + str(i + 1)
		# Acessa o nó FrameVazio correspondente dinamicamente
		var frame_vazio = get_node(grid)
		
		var label = frame_vazio.get_node("Label")  
		
		
		# Verifica se há letras suficientes e atribui
		if i < len(letras):
			label.text = letras[i]  # Define a letra na célula
		else:
			label.text = ""  # Deixa a célula vazia se não houver mais letras
			
# Função para exibir as letras no GridContainer de forma embaralhada
func embaralha(selecionadas):
	# Cria uma lista de letras das palavras selecionadas
	var letras = []
	for selecionada in selecionadas:
		letras.append_array(selecionada["palavra"].split(""))  # Adiciona as letras das palavras

	# Duplica as letras (para criar as palavras do jogo, por exemplo, "BALA" e "BALA")
	#var letras_duplicadas = letras.duplicate()  # Duplicando a lista de letras

	# Junta as duas listas de letras
	#letras.append_array(letras_duplicadas)

	# Embaralha as letras para garantir aleatoriedade
	letras.shuffle()

	# Exibe as letras nos 16 espaços do GridContainer
	#var gridLetras = $FrameLetras
	for i in range(16):
		var gridLetras = "FrameLetras" + str(i + 1)
		# Acessa o nó FrameVazio correspondente dinamicamente
		var frame_letras = get_node(gridLetras)
		var labelLetras = frame_letras.get_node("Label") 
		
		# Atribui a letra embaralhada na célula
		labelLetras.text = letras[i]


# Called when the node enters the scene tree for the first time.
func _ready():
	carregar_imagens() # Replace with function body.
