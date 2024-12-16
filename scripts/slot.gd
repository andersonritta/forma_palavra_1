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

		# A letra deve ser marcada como ocupada enquanto está no slot
		letra.set("draggable", false)
	else:
		# Se o slot já está ocupado, retorna a letra ao seu lugar de origem
		letra.reset_position()

# Verifica se a letra colocada no slot é a correta
func verificar_resposta(_letra: Node2D):
	var label_slot = $Label.text  # Obtém o texto da label associada ao slot
	if letra_associada == label_slot:
		$Sprite2D.modulate = Color(0, 1, 0)  # Verde para correta
		get_tree().root.get_node("Game").registrar_acerto()
	else:
		$Sprite2D.modulate = Color(1, 0, 0)  # Vermelho para incorreta
		get_tree().root.get_node("Game").registrar_erro()

# Atualiza o visual do slot
func atualizar_visual():
	if ocupada:
		$Sprite2D.modulate = Color(0.8, 0.8, 0.8)  # Slot com um tom neutro
	else:
		$Sprite2D.modulate = Color(1, 1, 1)  # Slot vazio

# Método para resetar o estado do slot
func resetar_slot():
	letra_associada = ""
	ocupada = false
	atualizar_visual()
