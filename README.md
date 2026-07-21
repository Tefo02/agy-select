# agy-select 🤖🔍

**agy-select** é um utilitário interativo escrito em Bash para gerenciar, pesquisar e retomar rapidamente sessões de conversa passadas da CLI do Google Antigravity (`agy`). Ele fornece uma interface de terminal rápida baseada em `fzf` com pré-visualização (preview) em tempo real da conversa.

*Read this in other languages: [English](#english-version).*

---

## Recursos (Features)

*   **⚡ Desempenho Ultra-rápido:** Processa centenas de históricos de conversas em milissegundos utilizando processamento em lote com uma única chamada do `jq`.
*   **📅 Ordenação por Recência:** Lista as conversas da mais recente para a mais antiga automaticamente.
*   **👁️ Visualização em Tempo Real (Preview):** Mostra as últimas 20 mensagens da conversa ativa no painel direito do `fzf`, formatadas de forma legível (👤 User vs 🤖 AI).
*   **🧼 Limpeza de Metadados/Tags:** Remove automaticamente tags XML e metadados pesados do Antigravity (como `<skills>`, `<identity>`, `<ADDITIONAL_METADATA>`, etc.), mostrando apenas o texto limpo e legível.
*   **🛡️ Tolerante a Erros:** Ignora linhas corrompidas ou malformadas de JSON nos históricos graças ao tratamento com `try/catch`.

---

## Pré-requisitos

Certifique-se de ter as seguintes ferramentas instaladas em seu sistema:

*   **`agy`** (Antigravity CLI)
*   **`fzf`** (Fuzzy Finder)
*   **`jq`** (Processador JSON de terminal)
*   **`bash`** (v4.0 ou superior)

---

## Instalação e Configuração

1.  **Clone este repositório ou baixe o script:**
    ```bash
    git clone https://github.com/Tefo02/agy-select.git
    cd agy-select
    ```

2.  **Copie o script para o diretório de binários locais:**
    ```bash
    mkdir -p ~/.local/bin
    cp agy-select ~/.local/bin/agy-select
    chmod +x ~/.local/bin/agy-select
    ```

3.  **Adicione um alias (opcional) no seu `~/.bashrc` ou `~/.zshrc`:**
    ```bash
    echo "alias agy-select='~/.local/bin/agy-select'" >> ~/.bashrc
    source ~/.bashrc
    ```

---

## Como Usar

Basta digitar `agy-select` no seu terminal:
```bash
agy-select
```

*   Use as setas **UP/DOWN** ou digite para filtrar os tópicos das conversas.
*   O painel lateral direito exibirá o preview da conversa atual.
*   Pressione **ENTER** para retomar a conversa selecionada diretamente no seu terminal ativo.
*   Pressione **ESC** para cancelar e sair.

---

<a name="english-version"></a>

## English Version 🇬🇧

**agy-select** is a fast, interactive Bash utility to manage, search, and quickly resume past Google Antigravity (`agy`) CLI conversation sessions. It provides an intuitive terminal interface using `fzf` with a real-time conversation preview panel.

### Features
*   **⚡ Ultra-fast:** Processes hundreds of conversation logs in milliseconds using batch `jq` processing.
*   **📅 Recency Sorting:** Automatically lists conversations from newest to oldest.
*   **👁️ Live Preview:** Displays the last 20 messages of the highlighted conversation in a right-hand preview panel (👤 User vs 🤖 AI).
*   **🧼 Metadata Cleanup:** Automatically strips system XML tags (such as `<skills>`, `<identity>`, `<ADDITIONAL_METADATA>`) to display only clean, human-readable text.
*   **🛡️ Robust Parsing:** Tolerates corrupted or malformed JSON logs using safe `try/catch` evaluation.

### Installation
1.  Copy `agy-select` to `~/.local/bin/` and make it executable:
    ```bash
    mkdir -p ~/.local/bin
    cp agy-select ~/.local/bin/
    chmod +x ~/.local/bin/agy-select
    ```
2.  Add an alias to your shell config file (e.g., `~/.bashrc` or `~/.zshrc`):
    ```bash
    echo "alias agy-select='~/.local/bin/agy-select'" >> ~/.bashrc
    source ~/.bashrc
    ```
3.  Run it:
    ```bash
    agy-select
    ```
