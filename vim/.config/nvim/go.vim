" set autowrite
let g:go_fmt_command = "gofmt"
let g:go_fmt_options = {
    \ 'gofmt': '-s',
    \ }
let g:go_fmt_autosave = 0
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

let g:go_gopls_enabled = 0 
let g:go_gopls_options = ['-remote=unix;/tmp/gopls-daemon-socket']
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_referrers_mode = 'gopls'

