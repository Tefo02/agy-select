# agy-select 🤖🔍

**agy-select** é uma interface de terminal interativa (TUI) moderna estilo *lazygit*, escrita em Python 3, para gerenciar, pesquisar e retomar rapidamente sessões de conversa passadas da CLI do Google Antigravity (`agy`).

*Read this in other languages: [English](#english-version).*

---

## Recursos (Features)

*   **🖥️ Interface Estilo Lazygit:** Layout com 4 painéis organizados (`[1] Search`, `[2] Local Chats`, `[3] Global Chats` e `[4] Preview`) com navegação fluida.
*   **📂 Separação Local vs. Global:** Detecta automaticamente conversas iniciadas no diretório do projeto atual vs. conversas de outros workspaces.
*   **⚡ Desempenho Ultra-rápido:** Leitura instantânea via metadados do SQLite do Antigravity e carregamento sob demanda (*lazy-loading*) do histórico completo.
*   **🔍 Busca Dinâmica com UTF-8:** Filtre por ID da conversa, título ou por qualquer termo do histórico com suporte completo a caracteres acentuados.
*   **👁️ Preview com Rolagem Completa:** Visualização em balões estilizados com quebra de linha dinâmica (*word-wrap*), rolagem e estimativa de uso da janela de contexto.
*   **🛡️ Limpeza Inteligente sem Perda de Código:** Remove metadados internos do Antigravity (`<USER_REQUEST>`, `<skills>`, `<identity>`) mantendo código-fonte, templates C++, generics e tags intactos.
*   **🗑️ Exclusão Segura:** Apague conversas indesejadas diretamente pela interface (`d`), com diálogo de confirmação seguro que remove logs e bancos de dados da sessão.
*   **🖱️ Suporte Completo a Mouse:** Clique para focar e selecionar itens em qualquer painel, além de suporte a rolagem direcionada pelo ponteiro do mouse.

---

## Pré-requisitos

*   **`python`** (v3.8 ou superior com módulo `curses` padrão)
*   **`agy`** (Google Antigravity CLI)

> Não requer `fzf`, `jq` ou ferramentas externas adicionais.

---

## Instalação e Configuração

1.  **Clone este repositório:**
    ```bash
    git clone https://github.com/Tefo02/agy-select.git
    cd agy-select
    ```

2.  **Copie o executável para o seu diretório de binários locais:**
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

### Atalhos de Teclado

| Tecla / Atalho | Ação |
| :--- | :--- |
| **`ENTER`** | Retoma a conversa selecionada no `agy` (ou muda o foco se estiver na busca) |
| **`TAB`** / **`Shift+TAB`** | Alterna o foco sequencialmente entre os painéis (1 → 2 → 3 → 4) |
| **`1`**, **`2`**, **`3`**, **`4`** | Foca diretamente o painel correspondente |
| **`↑` / `↓`** ou **`k` / `j`** | Navega pelos itens da lista ou rola o preview |
| **`←` / `→`** ou **`h` / `l`** | Rola horizontalmente títulos longos na lista |
| **`Home` / `End`** | Pula para o primeiro / último item ou topo / fim do preview |
| **`PageUp` / `PageDown`** | Rola rapidamente o painel de preview |
| **`/`** | Pula imediatamente para a caixa de busca |
| **`Ctrl+U`** | Limpa o campo de busca |
| **`d`** | Exclui permanentemente a conversa selecionada (com confirmação) |
| **`q`** / **`ESC`** | Sai do aplicativo (ou desativa foco da busca) |

---

<a name="english-version"></a>

## English Version 🇬🇧

**agy-select** is a modern, interactive Lazygit-style Terminal User Interface (TUI) written in Python 3 to manage, search, and resume past Google Antigravity (`agy`) CLI sessions.

### Features
*   **🖥️ Lazygit-Style Interface:** 4 dedicated panels (`[1] Search`, `[2] Local Chats`, `[3] Global Chats`, and `[4] Preview`) with smooth keyboard and mouse navigation.
*   **📂 Local vs. Global Detection:** Automatically separates chats associated with the current workspace from global conversations.
*   **⚡ High Performance:** Instant startup using Antigravity's SQLite metadata and on-demand lazy loading of full transcripts.
*   **🔍 Full-text Search with UTF-8:** Search by conversation ID, topic title, or dialogue content with full accent and Unicode support.
*   **👁️ Full Transcript Preview:** Styled message bubbles with dynamic word wrapping, scroll tracking, and context window estimation.
*   **🛡️ Smart Code Preservation:** Strips internal Antigravity tags without mutilating code snippets, generics, or HTML.
*   **🗑️ Safe Session Deletion:** Delete unwanted conversations with `d`, wiping both transcript logs and session SQLite database safely.
*   **🖱️ Full Mouse Support:** Click to focus panels and select conversations, plus targeted mouse wheel scrolling.

### Prerequisites
*   **`python`** (v3.8+ with standard `curses`)
*   **`agy`** (Google Antigravity CLI)

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
