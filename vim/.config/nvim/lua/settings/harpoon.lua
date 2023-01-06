require("harpoon").setup(
    {
        global_settings = {
            enter_on_sendcmd = true,
            tmux_autoclose_windows = true,
        },
        projects = {
            -- Yes $HOME works
            ["$HOME/.vim/saved_workspaces/dotfiles"] = {
                terms = {
                    cmds = {
                        "ls -la\n"
                    }
                }
            },
        }
    }
)

