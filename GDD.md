# Forma Palavras

## Game Design Document

### Versão: 1.0

---

### Autores:
- Ricardo Cordeiro
- Yuri Nunes
- Lucas Tavares
- Marcelo Rezende
- Andersson de Souza
- Luiz Vitalino dos Santos

Rio Grande do Sul,  
Dezembro de 2024

---

## Índice
1. [Descrição](#descricao)
2. [Público-Alvo](#Publico-alvo)
3. [Plataformas](#plataformas)
4. [História](#historia)
5. [Gameplay](#gameplay)
4. [Mecânicas do Jogo](#mecanica-do-jogo)
5. [Componentes da Interface](#componentes-da-interface)
6. [Elementos Artísticos](#elementos-artisticos)
8. [Sistemas de Fases](#sistemas-de-fases)
9. [Tecnologia Utilizada](#tecnologia-utilizada)
10. [Cronograma de Desenvolvimento](#cronograma-de-desenvolvimento)

---
## Descrição <a name="descricao"></a>
Um jogo educativo voltado para crianças com Transtorno do Espectro Autista (TEA), onde o jogador deve formar palavras relacionadas a imagens exibidas na tela. O jogo é projetado para estimular habilidades cognitivas, como associação visual, reconhecimento de letras, formação de palavras e tomada de decisão.  

## Público-Alvo <a name="publico-alvo"></a>
- Crianças de 6 a 10 anos com TEA ou que estejam em processo de alfabetização.  

## Plataformas <a name="plataformas"></a>
- Mobile (Android)  

---
## História <a name="historia"></a>

O jogo educativo digital baseado no jogo de tabuleiro “Forma Palavras”, que tem a intenção de estimular a capacidade cognitiva de crianças com Transtorno  do Espectro Autista (TEA). Tem um início onde apresentamos um menu ilustrado com o nome do jogo, uma música ambiente de jogo para manter a atenção e foco do jogador e com quatro funções, onde duas delas são para início sendo o botão “Jogar” e o ícone “ X “ que resultará no fechamento do jogo. As outras duas funções configuram a partida que se iniciará, o botão "ícone de ferramenta" é o ajuste de dificuldade, onde o jogador escolherá com quantas vidas deseja começar o jogo, a cada erro se perde uma vida, chegando ao fim do jogo ao perder todas vidas ou passar por todas fases. O terceiro botão  é o "ícone de lista" que configura o áudio da partida, ajustando o volume da música e também dos efeitos sonoros.
Quando se dá início a jogatina, a tela altera do menu para a tela principal do jogo, onde, se encontra a localização dos desenhos e seus respectivos espaços para se formar as palavras com o seguinte baralho de letras, o jogos terá cinco fases, cada uma delas com quatro desenhos para se formar suas respectivas palavras, em cada fase, o jogo deverá arrastar com o dedo as letras do baralho de letras e colocar na respectiva posição da palavra, com o intuito de formar a palavra do desenho. Assim que terminar todas palavras, poderá apertar o botão confirmar para seguir para próxima fase. O jogo chegará ao fim, quando o jogador terminar a fase 5.
Na tela de jogo, contém duas opções para melhorar a jogabilidade, uma delas é a opção de mutar ou ativar dicas, para um maior entendimento no início do jogo. E também a função relógio que contará o tempo em segundos da sessão do início ao fim da sessão.
Os efeitos sonoros que contém no jogo são bem intuitivos, quando se coloca uma letra em uma posição vazia da palavra, se tiver correta, ele sonora um sino de acerto e ao contrário sonora uma buzina que significa que a letra está na posição incorreta. Os efeitos sonoros também se ativam ao apertar em confirmar, quando se passa para a próxima fase.
A tela final do jogo, se tem dois botões onde se pode “Jogar novamente”, para iniciar mais uma sessão e também retornar ao menu principal, onde se pode reconfigurar as definições antes de iniciar a sessão novamente.

---

## Gameplay <a name="gameplay"></a>

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

## Mecânica do Jogo <a name="mecanica-do-jogo"></a>


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

## Componentes da Interface <a name="componentes-da-interface"></a>

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

## Elementos Artísticos <a name="elementos-artisticos"></a>

### **Estilo Visual**  
- Estilo colorido, vibrante e amigável para crianças.  
- Ícones e imagens grandes e fáceis de identificar.  

### **Áudio**  
- Música de fundo calma e relaxante.  
- Sons para ações específicas, como erros e acertos.  

---

## Sistemas de Fases <a name="sistemas-de-fases"></a>

- Cada fase apresenta:
  - Quatro novas imagens.
  - Letras embaralhadas relacionadas às palavras.  

---

## Tecnologia Utilizada <a name="tecnologia-utilizada"></a>

- **Godot Engine**: Para desenvolvimento do jogo.  
- **CSV**: Para armazenamento e exportação dos dados coletados.  
- **Figma**: Para criação do protótipo visual e design da interface.  

---

## Cronologia de Desenvolvimentos <a name="cronologia-de-desenvolvimento"></a>

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
