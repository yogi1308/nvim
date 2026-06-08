# Neovim Cheatsheet

Custom configuration for a powerful development environment.

## ⌨️ General Mappings

| Keybinding | Action |
|------------|--------|
| `<leader>` | `Space` |
| `<localleader>` | `\` |
| `<leader>y` | Yank selection to system clipboard |
| `<leader>Y` | Yank line to system clipboard |
| `<leader>ya` | Yank entire file to system clipboard |
| `<leader>da` | Delete entire file content |
| `<leader>rn` | Toggle relative line numbers |
| `<leader>t` | Open terminal in bottom split (40% height) |
| `<C-l>` | Clear search highlights and redraw |
| `<leader>ss` | Replace word under cursor (with confirmation) |
| `<A-Down>` | Move current line or selection down |
| `<A-Up>` | Move current line or selection up |
| `<leader>r` | Paste over selection (without overwriting yank register) |
| `<leader>dd` | Delete to black hole register (preserves yank register) |
| `<Esc>` | Dismiss notifications (Noice) |

### 🛠️ Programming & Utils
| Keybinding | Action |
|------------|--------|
| `<leader>cb` | Compile current C++ file |
| `<leader>cr` | Run current C++ file |
| `<leader>cx` | Compile and run current C++ file |
| `<leader>pr` | Run current Python file |
| `<leader>sr` | Open project-wide search/replace (Grug-far) |
| `<leader>sw` | Search for word under cursor (Grug-far) |
| `Auto-save` | Enabled on `InsertLeave` and `TextChanged` |

---

## 🔍 Navigation & Search (Telescope)

| Keybinding | Action |
|------------|--------|
| `<leader>ff` | Find files |
| `<leader>fa` | Find all files (including hidden) |
| `<leader>fg` | Live grep |
| `<leader>fG` | Live grep (including hidden) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Help tags |
| `<leader>fk` | Find keymaps |
| `<leader>fr` | Clipboard history (Neoclip) |
| `<leader>fb` | File Browser (enhanced navigation) |

### 📂 File Explorer (Neo-tree)
| Keybinding | Action |
|------------|--------|
| `<leader>nn` | Toggle Neo-tree filesystem sidebar |

---

## 🚀 LSP & Code Intelligence

| Keybinding | Action |
|------------|--------|
| `K` | Hover information |
| `gd` | Go to definition |
| `<leader>ca` | Code actions |
| `<leader>gf` | Format buffer (None-ls) |
| `C-space` | Open completion menu (Blink.cmp) |
| `C-n`/`C-p` | Select next/previous completion item |
| `C-k` | Toggle signature help |

---

## 🗂️ Buffer Management (Bufferline & BufDel)

| Keybinding | Action |
|------------|--------|
| `<S-l>` | Go to next buffer |
| `<S-h>` | Go to previous buffer |
| `<A-l>` | Move current buffer (tab) right |
| `<A-h>` | Move current buffer (tab) left |
| `<leader>x` | Close current buffer (BufDel) |
| `<leader>X` | Close all other buffers |
| `<leader>1-9`| Jump to buffer by number |

---

## 🐛 Debugging (DAP)

| Keybinding | Action |
|------------|--------|
| `<leader>dt` | Toggle breakpoint |
| `<leader>dc` | Continue debugging |

---

## 🌿 Git Integration (Gitsigns)

| Keybinding | Action |
|------------|--------|
| `]h` | Next hunk |
| `[h` | Previous hunk |
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gp` | Preview hunk |
| `<leader>gb` | Blame line |
| `<leader>gd` | Diff this file |

---

## 🧊 Multi-Cursor (Vim-Visual-Multi)

| Keybinding | Action |
|------------|--------|
| `Ctrl-n` | Select word under cursor (add next with repeat) |
| `Ctrl-Up/Down` | Create cursors vertically |
| `Shift-Arrows` | Create cursors by selecting |
| `n/N` | Next/Previous occurrence |
| `q` | Skip current occurrence |
| `Tab` | Toggle between **Cursor** and **Extend** mode |

---

## 📝 Markdown Preview

| Keybinding | Action |
|------------|--------|
| `:MarkdownPreview` | Start the preview |
| `:MarkdownPreviewStop` | Stop the preview |
| `:MarkdownPreviewToggle` | Toggle the preview |

---

## 🏃 Common Vim Motions & Commands

### 📍 Navigation
- `h`, `j`, `k`, `l`: Left, Down, Up, Right
- `w` / `W`: Move to start of next word / WORD (space-separated)
- `b` / `B`: Move to start of previous word / WORD
- `e` / `E`: Move to end of word / WORD
- `0` / `^`: Move to start of line / first non-blank character
- `$`: Move to end of line
- `gg` / `G`: Go to first line / last line
- `Ctrl-d` / `Ctrl-u`: Scroll half-page down / up
- `f{char}` / `F{char}`: Jump to next / previous occurrence of `{char}`
- `t{char}` / `T{char}`: Jump to just before / after next / previous occurrence of `{char}`
- `;` / `,`: Repeat last `f/t` jump forward / backward
- `%`: Jump between matching brackets

### 📦 Text Objects (The "Inner" and "Around" Power)
Used after operators like `d` (delete), `c` (change), or `y` (yank):
- `iw`: **I**nner **w**ord (the word itself)
- `aw`: **A**round **w**ord (word plus surrounding whitespace)
- `it` / `at`: **I**nner / **A**round **t**ag (for HTML/XML)
- `i"` / `a"` / `i'` / `a'`: **I**nner / **A**round quotes
- `i(` / `a(` or `ib` / `ab`: **I**nner / **A**round parentheses (brackets)
- `i{` / `a{` or `iB` / `aB`: **I**nner / **A**round curly braces
- `ip` / `ap`: **I**nner / **A**round paragraph

### ✏️ Editing
- `i` / `a`: Insert before / after cursor (append)
- `I` / `A`: Insert at start / end of line
- `o` / `O`: Open new line below / above
- `x`: Delete character under cursor
- `dw` / `diw`: Delete word / delete inner word
- `dd` / `D`: Delete line / delete to end of line
- `cc` / `C`: Change line / change to end of line
- `yy`: Yank (copy) line
- `p` / `P`: Paste after / before cursor
- `u` / `Ctrl-r`: Undo / Redo
- `.`: Repeat last change

### 📼 Macros (Automation)
- `q{register}`: Start recording macro into `{register}` (e.g., `qa`)
- `q`: Stop recording
- `@{register}`: Execute macro from `{register}` (e.g., `@a`)
- `@@`: Repeat last executed macro

---

## 🔄 Surrounding (Vim-Surround)

| Command | Action | Example |
|---------|--------|---------|
| `ys{motion}{char}` | **Add** surrounding | `ysiw"` → `word` to `"word"` |
| `yss{char}` | **Add** to entire line | `yss(` → `line` to `( line )` |
| `ds{char}` | **Delete** surrounding | `ds"` → `"word"` to `word` |
| `cs{old}{new}` | **Change** surrounding | `cs"'` → `"word"` to `'word'` |
| `S{char}` | **Add** in Visual Mode | Select text, then `S<p>` to wrap in tags |

**Pro Tip (Brackets):**
- Use **opening** brackets `(` `[` `{` for **spaced** surroundings: `( word )`
- Use **closing** brackets `)` `]` `}` for **tight** surroundings: `(word)`
- Use `t` for **HTML/XML tags**: `cst"`, `dst`, `yst<div>`

---

## 🛠️ Command Line & Refactoring

### 🔍 Find & Replace
- `:%s/old/new/g`: Replace all `old` with `new` in current file
- `:%s/old/new/gc`: Replace with **confirmation** for each match
- `:s/old/new/g`: Replace in **current line** only
- `:'<,'>s/old/new/g`: Replace in **visual selection**

### 📂 File & Buffer Commands
- `:w`: Save (write)
- `:q`: Quit (fails if unsaved)
- `:wq` / `:x`: Save and quit
- `:q!`: Force quit (discard changes)
- `:e {file}`: Open a new file
- `:bd`: Delete (close) current buffer
- `:vsplit {file}`: Open file in vertical split
- `:split {file}`: Open file in horizontal split

### 💻 Shell & External
- `<leader>t`: Open terminal in bottom split (40% height)
- `<C-\><C-n>`: **Exit Terminal Mode** (returns to Normal mode)
- `:!{cmd}`: Execute shell command (e.g., `:!ls`)
- `:terminal`: Open a built-in terminal
- `:r !{cmd}`: Read output of command into current buffer
- `exit`: Type inside terminal to close it

---

## 🔍 Search (Telescope)

---

## ✨ Enhancements

### 🔢 Dial (Incremental Logic)
- `<C-a>`: Increment number, hex, boolean, etc.
- `<C-x>`: Decrement number, hex, boolean, etc.

### 🗺️ Minimap (Neominimap)
- `<leader>nm`: Toggle global minimap
- `<leader>nf`: Focus minimap
- `<leader>ns`: Toggle focus

### ❓ Help
- `<leader>?`: Show buffer local keymaps (Which-key)

---

## 🏠 Dashboard (Alpha)
When Neovim starts, use these shortcuts:
- `f`: Find file
- `e`: New file
- `r`: Recent files
- `g`: Find text
- `p`: Projects
- `c`: Config directory
- `l`: Lazy plugin manager
- `q`: Quit
