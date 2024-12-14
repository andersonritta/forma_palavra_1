extends StaticBody2D

var letra_associada = ""  # Armazena a letra que foi colocada no slot
var letra_correta = ""    # Armazena a letra correta esperada no slot
var ocupada = false       # Indica se o slot está ocupado

func _ready():
	ocupada = false
	atualizar_visual()

# Verifica se o slot está ocupado
func pode_receber_letra() -> bool:
	return not ocupada

# Recebe a letra no slot
func receber_letra(letra: String) -> void:
	if pode_receber_letra():
		letra_associada = letra
		ocupada = true
		atualizar_visual()
	else:
		print("Slot já está ocupado!")

# Reseta o slot (caso necessário)
func resetar_slot():
	letra_associada = ""
	ocupada = false
	atualizar_visual()

# Atualiza o visual do slot com base no estado
func atualizar_visual():
	if ocupada:
		$Sprite2D.modulate = Color(0, 1, 0)  # Verde: ocupado
	else:
		$Sprite2D.modulate = Color(1, 1, 1)  # Branco: vazio

# Verifica se a letra no slot é a correta
func verificar_resposta():
	if letra_associada == letra_correta:
		# Se a letra estiver correta, podemos mudar o visual do slot (verde, por exemplo)
		$Sprite2D.modulate = Color(0, 1, 0)  # Verde para correta
		print("Correto!")  # Para depuração
	else:
		# Se a letra estiver errada, resetar o slot (ou outro feedback)
		$Sprite2D.modulate = Color(1, 0, 0)  # Vermelho para incorreta
		print("Errado!")  # Para depuração
