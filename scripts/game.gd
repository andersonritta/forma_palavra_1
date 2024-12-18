extends Node2D

var config_player = preload("res://scripts/config_player.gd")

var vidas = ConfigPlayer.get_num_vidas()  # Número inicial de vidas
var num_dicas = ConfigPlayer.get_num_dicas()  # Número inicial de 
var is_muted = false 
var vidas_iniciais = ConfigPlayer.get_num_vidas()

var numero_da_fase = 1
var palavras_usadas = []
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

var slots = []
var contador_acertos = 0
var contador_erros = 0
var total_acertos = 0
var total_erros = 0
var resultados_fases = []

var tempo_decorrido = 0.0
var tempo_fase_atual = 0.0  # Tempo da fase atual
var tempos_fases = []       # Lista para armazenar o tempo de cada fase
var historico_palavras = []
var palavras_formadas = [] 

func carregar_imagens():
	Arrays.reset()
	palavras.shuffle()
	var palavras_disponiveis = []

	for palavra in palavras:
		if not palavras_usadas.has(palavra):
			palavras_disponiveis.append(palavra)

	if palavras_disponiveis.size() < 4:
		print("Não há palavras suficientes para gerar uma nova fase!")
		return

	palavras_disponiveis.shuffle()
	var selecionadas = palavras_disponiveis.slice(0, 4)
	palavras_usadas.append_array(selecionadas)

	# Salva as palavras geradas para esta fase no histórico
	var palavras_da_fase = []
	for p in selecionadas:
		palavras_da_fase.append_array(p["palavra"].split(""))
	historico_palavras.append(palavras_da_fase)  # Adiciona palavras geradas na fase ao histórico


	# Associando as letras corretas aos slots
	for i in range(4):
		var imagem_node = $Board.get_node("FrameImagem" + str(i + 1))
		imagem_node.texture = load(selecionadas[i]["imagem"])

		# Configurando as letras corretas para os slots
		var slot = $Board.get_node("Slot" + str(i + 1))  # Slot correspondente
		slot.letra_correta = selecionadas[i]["palavra"]  # Configura a palavra correta no slot

		# Atualizando a label do slot com a palavra inteira (ou com a letra correta)
		var label_slot = slot.get_node("Label")
		label_slot.text = selecionadas[i]["palavra"][0]  # Exibe apenas a primeira letra

	embaralha(selecionadas)  # Embaralha as letras corretamente
	mostrar_letras(selecionadas)  # Exibe as letras embaralhadas nos slots

# Após preencher as letras, podemos tornar as labels visíveis
	for i in range(16):
		var frame_vazio = $Board.get_node("Slot" + str(i + 1))
		var label = frame_vazio.get_node("Label")
		label.visible = false
		Arrays.slots_id.append(frame_vazio)
		Arrays.slot.append(label.text)
		
	#print(Arrays.slots_id)
	print(Arrays.slot)
	print(Arrays.letters)
	
	

func mostrar_letras(selecionadas):
	var letras = []
	
	# Coleta todas as letras das palavras selecionadas
	for selecionada in selecionadas:
		letras.append_array(selecionada["palavra"].split(""))  # Divide as palavras em letras

	var grid = $Board
	var i = 0  # A variável 'i' será usada para preencher os slots com as letras corretas
	
	# Preenche os slots com as letras embaralhadas
	for palavra in selecionadas:
		for letra in palavra["palavra"].split(""):
			var frame_vazio = grid.get_node("Slot" + str(i + 1))
			var label = frame_vazio.get_node("Label")
			label.text = letra  # Atribui uma letra para o slot correspondente
			i += 1

	# Preenche as letras aleatórias nas posições restantes (de 4 até 16, por exemplo)
	var letras_aleatorias = []
	var alfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	for j in range(12):  # Adiciona 12 letras aleatórias
		letras_aleatorias.append(alfabeto[randi() % alfabeto.length()])
	
	letras_aleatorias.shuffle()  # Embaralha as letras aleatórias
	for j in range(i, 16):  # Preenche os slots restantes com letras aleatórias
		var frame_vazio = grid.get_node("Slot" + str(j + 1))
		var label = frame_vazio.get_node("Label")
		label.text = letras_aleatorias.pop_front()  # Pega uma letra aleatória para o slot

func embaralha(selecionadas):
	# Coleta todas as letras das palavras selecionadas
	var letras_palavras = []
	for selecionada in selecionadas:
		letras_palavras.append_array(selecionada["palavra"].split(""))

	# Preenche as 16 primeiras posições com as letras das palavras
	var gridLetras = $Board

	# Cria uma lista com as 12 letras aleatórias (do alfabeto ou letras extras)
	var letras_aleatorias = []
	var alfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	for i in range(12):
		letras_aleatorias.append(alfabeto[randi() % alfabeto.length()])

	# Embaralha as letras aleatórias
	letras_aleatorias.shuffle()

	# Agora, preenche as posições de letras
	var todas_as_letras = letras_palavras + letras_aleatorias
	todas_as_letras.shuffle()  # Embaralha as letras combinadas

	for i in range(16):
		var frame_letras = gridLetras.get_node("Letter" + str(i + 1))
		var labelLetras = frame_letras.get_node("Label") 
		labelLetras.text = todas_as_letras[i]

	# Agora, preenche as 12 novas letras nas posições restantes
	for i in range(16, 28):
		var frame_letras = gridLetras.get_node("Letter" + str(i + 1))
		var labelLetras = frame_letras.get_node("Label") 
		labelLetras.text = todas_as_letras[i]


func _ready():
	Arrays.reset()
	$Interface/BotOFase/FaseLabel.text = "Fase " + str(numero_da_fase)
	$Interface/NumVidas.text = "Vidas: " + str(ConfigPlayer.numVidas)
	#$Interface/NumDicas.text = "Dicas: " + str(ConfigPlayer.numDicas)
	var sound_manager = get_node("res://scripts/SoundManager.gd")
	carregar_imagens()
	$Interface/TimerLabel.visible = false
	
func _on_botao_proxima_fase_pressed():
	SoundManager.play_click()
	
	# Salva os resultados da fase atual
	resultados_fases.append({
		"fase": numero_da_fase,
		"acertos": contador_acertos,
		"erros": contador_erros,
		"tempo": tempo_fase_atual,
		"slot": Arrays.slot,   
		"letters": Arrays.letters,
		"results": Arrays.result,
		"palavras_formadas": palavras_formadas
	})
	
	palavras_formadas.append(Arrays.letters)
	 # Adiciona o tempo da fase atual à lista de tempos
	tempos_fases.append(tempo_fase_atual)
	
	# Comparar as palavras geradas e formadas
	var palavras_geradas = historico_palavras[numero_da_fase - 1]
	var palavras_da_fase_formadas = Arrays.letters

	if palavras_geradas == palavras_da_fase_formadas:
		print("Palavras CORRETAS! Avançando para próxima fase.")
		SoundManager.play_fase_correta()
	else:
		print("Palavras INCORRETAS! Perdendo 1 vida.")
		ConfigPlayer.numVidas -= 1  # Decrementa uma vida usando o autoloader
		print("Vidas restantes: ", ConfigPlayer.numVidas)
		$Interface/NumVidas.text = "Vidas: " + str(ConfigPlayer.numVidas)
		SoundManager.play_fase_errada()

		if ConfigPlayer.numVidas <= 0:
			finalizar_jogo()
			get_tree().change_scene_to_file("res://scenes/FimDeJogo.tscn")
			return  # Evita continuar o processo após o fim do jogo
	
	# Reinicia os contadores para a nova fase
	contador_acertos = 0
	contador_erros = 0
	tempo_fase_atual = 0.0
	
	if numero_da_fase >= 7:
		Arrays.compare()
		finalizar_jogo()
		Arrays.reset()
		get_tree().change_scene_to_file("res://scenes/FimDeJogo.tscn")
	else:
		Arrays.compare()
		Arrays.reset()
	
		numero_da_fase += 1
		$Interface/BotOFase/FaseLabel.text = "Fase " + str(numero_da_fase)
		carregar_imagens()
	
		for obj in get_tree().get_nodes_in_group("draggable"):
			if obj.has_method("reset_position"):
				obj.reset_position()


func _on_timer_jogo_timeout():
	tempo_decorrido += 0.1
	tempo_fase_atual += 0.1
	$Interface/TimerLabel.text = "Tempo: %.1f segundos" % tempo_decorrido


func _on_options_pressed() -> void:
	OptionsMenu.show_pause_menu()
	SoundManager.play_click()

func _on_menu_pressed() -> void:
	Menu.show_pause_menu()
	SoundManager.play_click()

func registrar_acerto():
	contador_acertos += 1
	total_acertos += 1
	print("Acerto registrado! Total de acertos: ", contador_acertos)

func registrar_erro():
	contador_erros += 1
	total_erros += 1
	print("Erro registrado! Total de erros: ", contador_erros)
	
func finalizar_jogo():
	print("Jogo Finalizado!")
	print("Resumo Total:")

	# Calcula o tempo total do jogo somando todos os tempos das fases
	var tempo_total = calcular_tempo_total(tempos_fases)

	# Atualiza os resultados dividindo os valores de acertos e erros por 2
	atualizar_resultados(resultados_fases)

	# Exibe os resultados por fase
	exibir_resultados_fases(resultados_fases)

	# Exibe o histórico de palavras geradas
	exibir_palavras_geradas(historico_palavras)

	# Exibe as palavras formadas por fase
	exibir_palavras_formadas(palavras_formadas)

	# Comparar as palavras geradas com as formadas
	print("-------------------------------------------------------------------")
	comparar_palavras()

	# Exibe os totais acumulados
	exibir_totais_acumulados(total_acertos, total_erros, tempo_total)
	
	# Agora, exporta os dados para o CSV utilizando o autoloader
	CsvExporter.exportar_resultados_csv(resultados_fases, historico_palavras, palavras_formadas, tempos_fases)
	
	ConfigPlayer.numVidas = vidas_iniciais
	print("Vidas resetadas para: ", ConfigPlayer.numVidas)


# Função para calcular o tempo total do jogo
func calcular_tempo_total(tempos_fases: Array) -> float:
	var tempo_total = 0.0
	for tempo in tempos_fases:
		tempo_total += tempo
	return tempo_total


# Função para atualizar os resultados dividindo os acertos e erros por 2
func atualizar_resultados(resultados_fases: Array):
	for resultado in resultados_fases:
		resultado["acertos"] /= 2
		resultado["erros"] /= 2


# Função para exibir os resultados por fase
func exibir_resultados_fases(resultados_fases: Array):
	for resultado in resultados_fases:
		print("Fase %d:" % resultado["fase"])
		print("  Acertos: %d" % resultado["acertos"])
		print("  Erros: %d" % resultado["erros"])
		print("  Tempo: %.1f segundos" % resultado["tempo"])
		#print("  Resultado: %s" % str(resultado["results"]))
		#print("  Palavras montadas: %s" % str(resultado["palavras_formadas"]))
		print("-------------------------------------------------------------------------------------")


# Função para exibir o histórico das palavras geradas por fase
func exibir_palavras_geradas(historico_palavras: Array):
	print("Palavras geradas por fase:")
	for i in range(len(historico_palavras)):
		print("Fase %d: %s" % [i + 1, str(historico_palavras[i])])


# Função para exibir as palavras formadas por fase
func exibir_palavras_formadas(palavras_formadas: Array):
	print("Palavras Formadas por Fase:")
	for i in range(len(palavras_formadas)):
		print("Fase %d: %s" % [i + 1, str(palavras_formadas[i])])


# Função para exibir os totais acumulados
func exibir_totais_acumulados(total_acertos: int, total_erros: int, tempo_total: float):
	print("Total de Acertos: %d" % (total_acertos / 2))
	print("Total de Erros: %d" % (total_erros / 2))
	print("Tempo Total do Jogo: %.1f segundos" % tempo_total)

	
	
func comparar_palavras():
	# Lista para armazenar os resultados da comparação (acertos e erros)
	var resultados_comparacao = []

	# Percorrer cada fase para comparar as palavras
	for i in range(len(historico_palavras)):
		var fase_historico = historico_palavras[i]
		var fase_formada = palavras_formadas[i]

		# Verificar se o conteúdo de ambas as listas (historico e formadas) são iguais
		if fase_historico == fase_formada:
			resultados_comparacao.append("CORRETO")
		else:
			resultados_comparacao.append("ERRADO")

	# Exibir os resultados da comparação
	print("Comparação entre palavras esperadas e formadas:")
	for i in range(len(resultados_comparacao)):
		print("Fase %d: %s" % [i + 1, resultados_comparacao[i]])


func _on_check_button_toggled(checked: bool) -> void:
	if checked == true:
		$Interface/TimerLabel.visible = true

	if checked == false:
		$Interface/TimerLabel.visible = false


func _on_mutar_toggled(checked: bool) -> void:
	is_muted = checked  # Muda o estado do mute
	# Opcionalmente, pode-se alterar o texto ou a visibilidade de algo na interface se necessário
	  # Se o botão estiver marcado, mudo o som
	SoundManager.is_muted = is_muted  # Atualiza o estado de mute no SoundManager
