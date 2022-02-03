lua << EOF
require('bufferline').setup {
  options = {
    close_command = "sil! bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "sil! bdelete! %d", -- can be a string | function, see "Mouse actions"
  }
}
EOF
