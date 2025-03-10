extends Node

# Variável global para o contador de jogos
var contador_jogo = 1

# Função para exportar resultados para CSV
func exportar_resultados_csv(resultados_fases, historico_palavras, palavras_formadas, tempos_fases):
	var caminho_arquivo = "/storage/emulated/0/Documents/dados.csv"
	
	# Validação de dados de entrada
	if not (resultados_fases is Array and historico_palavras is Array and palavras_formadas is Array and tempos_fases is Array):
		print("Erro: Os dados fornecidos não são do tipo esperado. Todos devem ser Arrays.")
		return

	if resultados_fases.size() == 0:
		print("Erro: Não há resultados de fases para exportar.")
		return
	
	# Abrir o arquivo CSV em modo de leitura e escrita
	var file = FileAccess.open(caminho_arquivo, FileAccess.READ_WRITE)
	
	# Verificar se o arquivo existe e tem conteúdo
	if file == null:
		# Se o arquivo não existir, tenta criá-lo
		file = FileAccess.open(caminho_arquivo, FileAccess.WRITE)
		if file == null:
			print("Erro: Não foi possível criar o arquivo.")
			return
		print("Arquivo criado com sucesso!")
	else:
		# Se o arquivo existe e não está vazio, move o ponteiro para o final
		if file.get_length() > 0:
			file.seek_end()

	# Se o arquivo está vazio, escreve o cabeçalho
	if file.get_length() == 0:
		file.store_line("ID,Fase,Acertos,Erros,Tempo,Palavras Geradas,Palavras Formadas,Resultado")

	# Inicializa as variáveis para os totais
	var total_acertos = 0
	var total_erros = 0
	var tempo_total = 0.0

	# Adiciona os dados do novo jogo ao final do arquivo
	for i in range(resultados_fases.size()):
		var resultado = resultados_fases[i]
		var palavras_geradas = historico_palavras[i]
		var palavras_montadas = palavras_formadas[i]

		# Validação dos dados da fase
		if not resultado.has("fase") or not resultado.has("acertos") or not resultado.has("erros") or not resultado.has("tempo"):
			print("Erro: Falta dados em uma das fases. Verifique os resultados da fase.")
			return

		# Cria a linha para a fase com o ID único
		var linha = "%d,%d,%d,%d,%.1f,\"%s\",\"%s\",%s" % [
			contador_jogo,                    # ID único do jogo
			resultado["fase"],                # Número da fase
			resultado["acertos"],             # Total de acertos
			resultado["erros"],               # Total de erros
			resultado["tempo"],               # Tempo gasto
			",".join(palavras_geradas),       # Palavras geradas
			",".join(palavras_montadas),      # Palavras formadas
			"CORRETO" if resultado["acertos"] == 16 else "ERRADO"  # Resultado da comparação
		]
		file.store_line(linha)

		# Somar os acertos, erros e tempo total
		total_acertos += resultado["acertos"]
		total_erros += resultado["erros"]
		tempo_total += resultado["tempo"]

	# Adiciona os totais ao final do novo jogo
	# A coluna "Fase" fica em branco e preenche as colunas de Acertos, Erros e Tempo com os totais
	file.store_line("TOTAL,,%d,%d,%.1f,,," % [
		total_acertos,      # Total de acertos
		total_erros,        # Total de erros
		tempo_total         # Tempo total
	])

	# Fecha o arquivo
	file.close()
	print("Resultados exportados com sucesso para: user://resultado_jogo.csv")

	# Incrementa o contador para o próximo jogo
	contador_jogo += 1
