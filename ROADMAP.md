# Roadmap & Próximos Passos (Future Roadmap) 🚀

Este documento lista as melhorias planejadas e ideias para futuras implementações no **agy-select**.

---

## 📌 Idéias de Melhorias Planejadas

### 1. 🗑️ Exclusão de conversas diretamente pelo `fzf`
*   **Descrição:** Adicionar um atalho de teclado (como `ctrl-d` ou `del`) dentro da janela do `fzf` para apagar permanentemente o histórico da conversa selecionada (`rm -rf "$BRAIN_DIR/$cid"`) após uma confirmação rápida.
*   **Benefício:** Gerenciamento fácil do histórico sem precisar sair da interface interativa.

### 2. 🎨 Cores ANSI no Preview
*   **Descrição:** Adicionar códigos de escape ANSI no script do `jq` para colorir os rótulos do painel lateral (ex: `👤 User:` em ciano e `🤖 AI:` em verde).
*   **Benefício:** Leitura mais agradável e destaque visual nos diálogos.

### 3. 🔍 Busca no histórico completo (Full-text Search)
*   **Descrição:** Ajustar o processamento do `jq` para consolidar todas as interações da conversa em um campo oculto (ou processado) enviado ao `fzf`.
*   **Benefício:** Permitir pesquisar por qualquer palavra dita no meio de uma conversa antiga, e não apenas no último prompt do chat.

### 4. 🪟 Integração inteligente com Tmux
*   **Descrição:** Fazer o script detectar se está rodando dentro de uma sessão do Tmux e, caso esteja, abrir a conversa retomada em um novo painel dividido (split) ou janela dedicada do Tmux, preservando o terminal ativo original.
*   **Benefício:** Fluxo de trabalho multitarefa otimizado para usuários de Tmux.

### 5. ⏳ Paginação e Limite de Histórico
*   **Descrição:** Adicionar um limite (ex: carregar apenas as 50 conversas mais recentes por padrão, com opção de carregar tudo usando um parâmetro `--all`).
*   **Benefício:** Garantir que o script continue abrindo instantaneamente mesmo que você acumule milhares de conversas com o passar dos meses.

---

## 🇬🇧 English Version

### 1. 🗑️ Delete conversations directly from `fzf`
*   **Description:** Add a shortcut (like `ctrl-d` or `del`) inside `fzf` to permanently delete the selected conversation history (`rm -rf "$BRAIN_DIR/$cid"`) after a quick confirmation.
*   **Benefit:** Easier log management without exiting the tool.

### 2. 🎨 ANSI colors in Preview
*   **Description:** Inject ANSI escape codes via `jq` to colorize conversation headers in the preview panel (e.g., `👤 User:` in cyan and `🤖 AI:` in green).
*   **Benefit:** Better readability and styling in the terminal.

### 3. 🔍 Full-text search (FTS)
*   **Description:** Concat all conversation lines into a searchable hidden field sent to `fzf`.
*   **Benefit:** Find old conversations using any keyword sent/received, not just the last prompt.

### 4. 🪟 Smart Tmux Integration
*   **Description:** Detect Tmux environment and launch the resumed conversation in a new split panel or window.
*   **Benefit:** Keep current terminal active while multitasking.

### 5. ⏳ History Limits & Pagination
*   **Description:** Limit parsing to the most recent conversations (e.g., top 50) by default, with an `--all` flag to load the rest.
*   **Benefit:** Keep script initialization instant even with thousands of logs.
