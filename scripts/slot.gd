extends StaticBody2D

var letra_associada = ""  # Armazena a letra associada ao slot
var letra_correta = ""    # Armazena a letra correta esperada no slot
var ocupada = false       # Indica se o slot está ocupado

func _ready():
	ocupada = false
	atualizar_visual()

# Este método é chamado quando uma letra é colocada no slot
func receber_letra(letra: Node2D) -> void:
	if not ocupada:
		# Associa a letra ao slot
		letra_associada = letra.get_node("Label").text  # Obtém o texto da label da letra
		ocupada = true
		atualizar_visual()

		# Verifica se a letra colocada é correta
		verificar_resposta(letra)

# Verifica se a letra colocada no slot é a correta
func verificar_resposta(_letra: Node2D):
	var label_slot = $Label.text  # Obtém o texto da label associada ao slot
	if letra_associada == label_slot:
		# Se a letra for correta, o slot fica verde
		$Sprite2D.modulate = Color(0, 1, 0)  # Verde para correta
		#get_tree().root.get_node("Game").registrar_acerto()
		print("Correto!")
	else:
		# Se a letra for incorreta, o slot fica vermelho
		$Sprite2D.modulate = Color(1, 0, 0)  # Vermelho para incorreta
		#get_tree().root.get_node("Game").registrar_erro()
		print("Errado!")

# Atualiza o visual do slot, caso esteja ocupado ou não
func atualizar_visual():
	if ocupada:
		$Sprite2D.modulate = Color(0, 1, 0)  # Slot fica verde se ocupado
	else:
		$Sprite2D.modulate = Color(1, 1, 1)  # Slot fica branco se vazio

# Método para resetar o estado do slot
func resetar_slot():
	letra_associada = ""
	ocupada = false
	atualizar_visual()
