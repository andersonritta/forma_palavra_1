# **Game Design Document (GDD)**  
## **Forma Palavras**  

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
Formar palavras de 4 letras relacionadas às imagens exibidas na tela.  

### **Loop Principal**  
1. Menu inicial com opção de jogar, configurações e créditos.
2. O jogador entra na fase.
3. Quatro imagens são exibidas, cada uma representando uma palavra de 4 letras.  
4. Letras embaralhadas aparecem na tela.  
5. O jogador seleciona as letras para formar as palavras correspondentes às imagens.  
6. O jogo verifica se as palavras formadas estão corretas.  
7. Ao preencher as palavras, o jogador pode avançar para a próxima fase.  
8. Finalizando as fases uma tela de fim de jogo é exibida.
---

### **Mecânicas do Jogo**

1. **Exibição Randômica de Imagens e Palavras**  
   - Quatro imagens e palavras são selecionadas aleatoriamente de um banco de dados sem repetição durante a partida.  

2. **Formação de Palavras**  
   - Um conjunto de 28 letras contendo as letras das palavras correspondentes às imagens são embaralhadas e apresentadas na tela  
   - O jogador seleciona as letras, colocando-as na ordem correta para formar cada palavra.  

3. **Timer Oculto**  
   - Cada fase possui um contador de tempo, que não será exibido para o jogador.   

4. **Dicas**  
   - As dicas do jogo podem ser desativadas ou ativadas.  
   - Com as dicas ativadas, ao posicionar a letra, um som será emitido para indicar se a escolha está correta ou incorreta.  
   - Com as dicas desativadas, será emitido apenas um som padrão, sem distinção entre respostas corretas e incorretas.  

5. **Coleta de Dados**  
   - Durante o jogo, os seguintes dados serão registrados:
      - Tempo total gasto para completar cada fase.
      - Quantidade de acertos.
      - Quantidade de erros cometidos.
      - Ordem em que as palavras foram formadas.
      - Verificação de correspondência e posição correta das letras.

6. **Exportação de Dados**  
   - Os dados coletados podem ser exportados em formato CSV para análise.  

7. **Configurações de Jogo**  
   - Ajustes de volume da música e sons.  
   - Ativar ou desativar dicas.  

---

## **Componentes de Interface**

### **Tela Inicial**  
- Botões:  
  - **Jogar**  
  - **Configurações**
  - **Sobre**
  - **Sair**  

### **Tela de Jogo**  
- **Imagens**: Quatro imagens posicionadas à esquerda da tela.  
- **Letras**: Letras embaralhadas à direita da tela.
- **Audio**: Botão para desligar o áudio
- **Indicadores**:
   - Ativar/desativar tempo
   - Ativar/desativar dicas
   - Quantidade de vidas

### **Tela de Fim de Fase**    
- Botão "Confirmar".  

### **Tela de Configurações**  
- Ajuste do volume da música.  
- Ajuste do volume dos efeitos sonoros.

### **Tela de Créditos**
- Informações sobre a faculdade, disciplina e integrantes do projeto.
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
- **CSV**: Para armazenamento e exportação dos dados coletados.  
- **Figma**: Para criação do protótipo visual e design da interface.  

---

## **Cronograma de Desenvolvimento**

| Etapa                      | Status       | Prazo         |
|----------------------------|--------------|---------------|
| Design no Figma            | Concluído    | 01/12/2024    |
| Interface Gráfica          | Concluído    | 05/12/2024    |
| Randomização de imagens    | Concluído    | 15/12/2024    |
| Adicionar Timer Oculto     | Concluído    | 16/12/2024    |
| Implementação de Dicas     | Concluído    | 17/12/2024    |
| Adição de Feedback Sonoro  | Concluído    | 17/12/2024    |
| Coleta de Dados            | Concluído    | 18/12/2024    |
| Exportação CSV             | Concluído    | 18/12/2024    |
| Configuração de Botões     | Concluído    | 18/12/2024    |
| Exportação para Mobile     | Concluído    | 18/12/2024    |

---
