extends StaticBody2D

var letra_associada = ""  # Armazena a letra associada ao slot
var letra_correta = ""

var ocupada = false       # Indica se o slot está ocupado

# Este método é chamado quando uma letra é colocada no slot
func receber_letra(letra: Node2D) -> void:
	if not ocupada:
		# Associa a letra ao slot
		letra_associada = letra.get_node("Label").text # Obtém o texto da label da letra
		var indice = Arrays.slots_id.find(self)
		Arrays.letters[indice] = letra_associada
		print(Arrays.letters)
		#ocupada = true

		# Verifica se a letra colocada é correta
		verificar_resposta(letra)

# Verifica se a letra colocada no slot é a correta
func verificar_resposta(_letra: Node2D):
	var label_slot = $Label.text  # Obtém o texto da label associada ao slot
	if letra_associada == label_slot:
		# Se a letra for correta, o slot fica verde
		#$Sprite2D.modulate = Color(0, 1, 0)  # Verde para correta
		print("Correto!")
		get_tree().root.get_node("Game").registrar_acerto()
		#ocupada = false
		SoundManager.play_acerto()
	else:
		# Se a letra for incorreta, o slot fica vermelho
		#$Sprite2D.modulate = Color(1, 0, 0)  # Vermelho para incorreta
		get_tree().root.get_node("Game").registrar_erro()
		print("Errado!")
		Arrays.error_num += 1
		#ocupada = false
		SoundManager.play_erro()


# Método para resetar o estado do slot
func resetar_slot():
	letra_associada = ""
	ocupada = false
