let g:peekup_open = '<leader>"'
lua << EOF
require('nvim-peekup.config').on_keystroke["paste_reg"] = '+'
EOF
