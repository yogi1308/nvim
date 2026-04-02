return { 
    'nvim-treesitter/nvim-treesitter', lazy = false, build = ':TSUpdate', 
    opts = {
        indent = { enable = true},
        highlight = { enable = true},
        folds = { enable = true },
        ensure_installed = {'rust', 'javascript', 'zig', 'tsx', 'jsx', 'typescript', 'bash', 'c', 'cpp', 'lua', 'markdown', 'python', 'toml', 'cmake', 'css', 'html', 'go', 'java', 'lua', 'ruby'}
    }
}
