# Neovim Cheatsheet

Custom configuration for a powerful development environment.

## ⌨️ General Mappings

| Keybinding | Action |
|------------|--------|
| `<leader>` | `Space` |
| `<localleader>` | `\` |
| `<leader>y` | Yank selection to system clipboard |
| `<leader>Y` | Yank line to system clipboard |
| `<leader>ya` | Yank entire file |
| `<leader>da` | Delete entire file |
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

