# Jogo Infantil - Forma Palavras

Este projeto foi desenvolvido para a disciplina **Desenvolvimento de Software**, com o objetivo de criar um jogo educativo voltado para crianças com Transtorno do Espectro Autista (TEA). O jogo tem como propósito principal coletar dados relevantes sobre o comportamento e desempenho das crianças durante a realização de atividades de formação de palavras.

---

## 🎯 Objetivo

Desenvolver um jogo que estimule o aprendizado e a interação, ao mesmo tempo que coleta informações importantes, como tempo de resposta, número de acertos e erros, e outros dados que possam ajudar na análise comportamental.

---

## 🛠️ Funcionalidades

### Funcionalidades Desenvolvidas
- [x] **Design do Jogo no Figma**: Um protótipo da interface do jogo foi criado para orientar o desenvolvimento.
- [x] **Interface Gráfica Dinâmica**: 
  - Apresentação de imagens relacionadas a palavras de 4 letras, exibidas de forma randômica.
  - Letras embaralhadas para que o jogador forme a palavra correspondente às imagens.
- [x] **Mecânica Básica**: Verificação das palavras formadas para identificar correspondência com as imagens apresentadas.

### Funcionalidades a Serem Desenvolvidas
- [x] **Randomização de Fases**: Garantir que as imagens e palavras não se repitam durante o jogo.
- [x] **Timer Oculto**: Adicionar um timer sem exibi-lo ao jogador.
- [x] **Responsividade**: Ajustar a interface para diferentes dispositivos.
- [x] **Coleta de Dados**:
  - [x] Tempo total gasto para completar cada fase.
  - [x] Quantidade de acertos.
  - [x] Quantidade de erros cometidos.
  - [x] Ordem em que as palavras foram formadas.
  - [x] Verificação de correspondência e posição correta das letras.
- [x] **Exportar CSV**: Criar uma funcionalidade para exportar os dados coletados em formato CSV.
- [X] **Exportar Aplicativo para Mobile**: Adaptar o jogo e exportá-lo como aplicativo para dispositivos Android.
- [x] **Adicionar e Configurar Botões**:
  - [x] Botão de **Configurações**.
  - [x] Botão para **Passar de Fase**.
  - [x] Botão para **Sair do Jogo**.
- [x] **Efeitos Sonoros**:
  - [x] Sons ao acertar uma letra.
  - [x] Sons ao errar uma letra.
- [x] **Música de Fundo**: Adicionar uma música relaxante ao jogo.
- [X] **Ajuste de Volume**: Permitir que o jogador ajuste o volume da música e dos sons do jogo.
- [x] **Ativar/Desativar Dicas**: Configuração para habilitar ou desabilitar o sistema de dicas.


---

## 🚀 Tecnologias Utilizadas

- **Godot Engine**: Ferramenta utilizada para o desenvolvimento do jogo.
- **Figma**: Utilizado para prototipagem e design.
- **CSV**: Para armazenamento e exportação dos dados coletados.

---

## 📌 Estrutura do Projeto

O projeto é organizado da seguinte forma:

├── assets
│   ├── Audio
│   ├── fonts
│   ├── icons
│   └── imgs
│       └── cards
├── scenes
└── scripts
