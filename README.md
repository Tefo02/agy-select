# agy-select 🤖🔍

**agy-select** é uma interface de terminal interativa (TUI) moderna estilo *lazygit*, escrita em Python 3, para gerenciar, pesquisar e retomar rapidamente sessões de conversa passadas da CLI do Google Antigravity (`agy`).

*Read this in other languages: [English](#english-version).*

---

## Recursos (Features)

*   **🖥️ Interface Estilo Lazygit:** Layout com 4 painéis organizados (`[1] Search`, `[2] Local Chats`, `[3] Global Chats` e `[4] Preview`) com navegação fluida.
*   **📂 Separação Local vs. Global:** Detecta automaticamente conversas iniciadas no diretório do projeto atual vs. conversas de outros workspaces.
*   **⚡ Desempenho Ultra-rápido:** Leitura instantânea via metadados do SQLite do Antigravity e carregamento sob demanda (*lazy-loading*) do histórico completo.
*   **🔍 Busca com Regex e Padrões (UTF-8):** Suporte completo a expressões regulares (ex.: `erro|falha`, `def\s+\w+`) e caracteres acentuados, com fallback seguro para busca literal enquanto digita.
*   **✨ Destaque Visual (Highlight) no Preview:** Ocorrências encontradas pelo padrão de busca são destacadas automaticamente em amarelo no painel de preview.
*   **🎯 Navegação de Ocorrências (`n` / `N`):** Pule diretamente para o próximo (`n`) ou anterior (`N`) match no preview sem travar a rolagem manual livre.
*   **👁️ Preview com Rolagem Completa:** Visualização em balões estilizados com quebra de linha dinâmica (*word-wrap*), rolagem e estimativa de uso da janela de contexto.
*   **🛡️ Limpeza Inteligente sem Perda de Código:** Remove metadados internos do Antigravity (`<USER_REQUEST>`, `<skills>`, `<identity>`) mantendo código-fonte, templates C++, generics e tags intactos.
*   **🏷️ Renomeação Persistente:** Renomeie conversas selecionadas pressionando `r`, com diálogo interativo e persistência imediata no SQLite do Antigravity.
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
| **`n`** / **`N`** | Pula para a próxima / anterior ocorrência encontrada no preview |
| **`↑` / `↓`** ou **`k` / `j`** | Navega pelos itens da lista ou rola o preview livremente |
| **`←` / `→`** ou **`h` / `l`** | Rola horizontalmente títulos longos na lista |
| **`Home` / `End`** | Pula para o primeiro / último item ou topo / fim do preview |
| **`PageUp` / `PageDown`** | Rola rapidamente o painel de preview |
| **`/`** | Pula imediatamente para a caixa de busca |
| **`Ctrl+U`** | Limpa o campo de busca |
| **`r`** | Renomeia o título da conversa selecionada (com diálogo e persistência no SQLite) |
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
*   **🔍 Full-text Search with Regex & UTF-8:** Search by conversation ID, topic title, or dialogue content using regular expressions (e.g. `error|fail`, `def\s+\w+`) with safe literal fallback.
*   **✨ Visual Highlight in Preview:** Pattern matches are highlighted in real-time in yellow inside the preview bubbles.
*   **🎯 Match Navigation (`n` / `N`):** Jump between next (`n`) and previous (`N`) search matches in the preview without locking free manual scrolling.
*   **👁️ Full Transcript Preview:** Styled message bubbles with dynamic word wrapping, scroll tracking, and context window estimation.
*   **🛡️ Smart Code Preservation:** Strips internal Antigravity tags without mutilating code snippets, generics, or HTML.
*   **🏷️ Persistent Session Renaming:** Rename conversations with `r`, featuring an interactive dialog and persistent storage in SQLite.
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

### Keyboard Shortcuts

| Key / Shortcut | Action |
| :--- | :--- |
| **`ENTER`** | Resume selected conversation in `agy` (or switch focus from search box) |
| **`TAB`** / **`Shift+TAB`** | Cycle panel focus sequentially (1 → 2 → 3 → 4) |
| **`1`**, **`2`**, **`3`**, **`4`** | Jump directly to corresponding panel |
| **`n`** / **`N`** | Jump to next / previous match in preview |
| **`↑` / `↓`** or **`k` / `j`** | Navigate list items or scroll preview freely |
| **`←` / `→`** or **`h` / `l`** | Horizontally scroll long titles |
| **`Home` / `End`** | Jump to first / last item or top / bottom of preview |
| **`PageUp` / `PageDown`** | Fast scroll preview panel |
| **`/`** | Focus search box immediately |
| **`Ctrl+U`** | Clear search query |
| **`r`** | Rename selected conversation (with dialog and SQLite persistence) |
| **`d`** | Delete selected conversation permanently (with confirmation) |
| **`q`** / **`ESC`** | Quit application (or unfocus search) |
