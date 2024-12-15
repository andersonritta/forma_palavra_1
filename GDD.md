# **Game Design Document (GDD)**  
## **Forma Palavras**  

---

## **Visão Geral**  

### **Descrição do Jogo**  
Um jogo educativo voltado para crianças com Transtorno do Espectro Autista (TEA), onde o jogador deve formar palavras relacionadas a imagens exibidas na tela. O jogo é projetado para estimular habilidades cognitivas, como associação visual, reconhecimento de letras, formação de palavras e tomada de decisão.  

### **Público-Alvo**  
- Crianças de 6 a 10 anos com TEA ou que estejam em processo de alfabetização.  

### **Plataformas**  
- Mobile (Android)  

---

## **Gameplay**

### **Objetivo Principal**  
Formar palavras de 4 letras relacionadas às imagens exibidas na tela dentro de um limite de tempo.  

### **Loop Principal**  
1. Menu inicial com opção de jogar e configurações.
2. O jogador entra na fase.
3. Quatro imagens são exibidas, cada uma representando uma palavra de 4 letras.  
4. Letras embaralhadas aparecem na tela.  
5. O jogador seleciona as letras para formar as palavras correspondentes às imagens.  
6. O jogo verifica se as palavras formadas estão corretas.  
7. Se todas as palavras forem formadas corretamente, o jogador pode avançar para a próxima fase.  

---

### **Mecânicas do Jogo**

1. **Exibição Randômica de Imagens e Palavras**  
   - Quatro imagens e palavras são selecionadas aleatoriamente de um banco de dados sem repetição durante a partida.  

2. **Formação de Palavras**  
   - As letras das palavras correspondentes às imagens são embaralhadas e apresentadas na tela.  
   - O jogador seleciona as letras, colocando-as na ordem correta para formar cada palavra.  

3. **Timer Oculto**  
   - Cada fase possui um contador de tempo, que não será exibido para o jogador.   

4. **Dicas**  
   - Caso o jogador demore muito, uma dica será exibida, como destacar a primeira letra da palavra correspondente.  

5. **Feedback Visual e Sonoro**  
   - Sons e animações para feedback:
	 - Ao formar uma palavra corretamente, um som de comemoração e uma animação positiva serão exibidos.  
	 - Ao errar, um som suave de erro e um destaque visual indicarão a falha.  

6. **Coleta de Dados**  
   - Durante o jogo, os seguintes dados serão registrados:
	 - Tempo gasto para completar cada fase.  
	 - Número de dicas.  
	 - Número de erros cometidos.  
	 - Ordem em que as palavras foram formadas.  
	 - Quantidade de acertos.  
	 - Letras selecionadas pelo jogador.  

7. **Exportação de Dados**  
   - Os dados coletados podem ser exportados em formato JSON para análise.  

8. **Configurações de Jogo**  
   - Ajustes de volume da música e sons.  
   - Ativar ou desativar dicas.  

---

## **Componentes de Interface**

### **Tela Inicial**  
- Botões:  
  - **Jogar**  
  - **Configurações**  
  - **Sair**  

### **Tela de Jogo**  
- **Imagens**: Quatro imagens no centro da tela.  
- **Letras**: Letras embaralhadas na parte inferior da tela.

### **Tela de Fim de Fase**  
- Pontuação da fase.  
- Mensagem indicando vitória.  
- Botão "Próxima Fase".  

### **Tela de Configurações**  
- Ajuste de volume.  
- Ativar/desativar dicas.  

---

## **Elementos Artísticos**

### **Estilo Visual**  
- Estilo colorido, vibrante e amigável para crianças.  
- Ícones e imagens grandes e fáceis de identificar.  

### **Áudio**  
- Música de fundo calma e relaxante.  
- Sons para ações específicas, como erros e acertos.  

---

## **Sistema de Fases**

- Cada fase apresenta:
  - Quatro novas imagens.
  - Letras embaralhadas relacionadas às palavras.  

---

## **Tecnologia Utilizada**

- **Godot Engine**: Para desenvolvimento do jogo.  
- **JSON**: Para armazenamento e exportação dos dados coletados.  
- **Figma**: Para criação do protótipo visual e design da interface.  

---

## **Cronograma de Desenvolvimento**

| Etapa                      | Status       | Prazo         |
|----------------------------|--------------|---------------|
| Design no Figma            | Concluído    | 01/12/2024    |
| Interface Gráfica          | Concluído    | 05/12/2024    |
| Randomização de imagens    | Em progresso | 15/12/2024    |
| Adicionar Timer Oculto     | A fazer      | 16/12/2024    |
| Implementação de Dicas     | A fazer      | 17/12/2024    |
| Adição de Feedback Sonoro  | A fazer      | 17/12/2024    |
| Coleta de Dados            | A fazer      | 18/12/2024    |
| Exportação JSON            | A fazer      | 18/12/2024    |
| Configuração de Botões     | A fazer      | 18/12/2024    |
| Exportação para Mobile     | A fazer      | 18/12/2024    |

---
