# Установка Nvim
## Отладка
## Install from snap on CentOS
sudo yum install epel-release
sudo yum install snapd
sudo systemctl enable --now snapd.socket
sudo systemctl start snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install nvim --edge --classic
## Install appimage from releases
appimage can be downloaded from here https://github.com/neovim/neovim/releases
## Install nodejs from snap on CentOS
sudo snap install node --classic
sudo npm install -g pyright neovim
## Установка clang, чтобы пофиксить сборку treesitter
sudo yum install centos-release-scl
sudo yum install llvm-toolset-7
scl enable llvm-toolset-7 bash
Либо на постоянку в .bashrc:
export PATH=$PATH:/opt/rh/llvm-toolset-7/root/usr/bin/
## lua для treesitter CentOS
yum install lua luajit lua.devel
## Install ripgrem on CentOS 
sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
sudo yum instal repgrep
## Ребилдим CoC
cd .vim/pluged/coc.nvim
yarn install
yarn build
## Установка LazyGit
sudo yum install dnf
sudo dnf install dnf-plugins-core
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit
## Настройка CoC
CocInstall
TSInstall
TSUpdate
:checkhealth
## Python
В нужно окружении ставим плагины neovim, pynvim
Или вообще в системе:
pip install pynvim neovim
Прописываем в coc-settings.json  python.pythonPath
## Workspaces
Заходим в нужную папку, выполняем WorkspaceInit  
Сохраняем проект WorkspaceSave project  
## Env воркспейса  
В .env можно положить что-то типа:  
source ${WORSPACE}/env/bin/activate  
## Glow
Вероятно нужно это пока автор не внесёт нужные изменения https://issueexplorer.com/issue/charmbracelet/glow/212  
Бинарь потом нужно закинуть в .local/bin  
Ещё по какой-то причине пишлось закомментить скачивание glow, он почему-то его не видел
## Cmp
yay -S pylyzer efm-langserver lua-language-server shellcheck
go install mvdan.cc/sh/v3/cmd/shfmt@latest
npm install -g prettier prettier-plugin-sh prettier-plugin-sql 


## Хоткеи которые использую активно
- TAB/S-TAB переход по буферам
- C-s сохранеие файла
- /gg LazyGit
- C-q выход из буфера
- /t запуск теста
- /tf запуск текущего теста
- /tt /tg /tk /tl открытие терминала
- M-n/p переход вперёд назад по терминалам
- C-o, C-i движение вперёд назад по буферам
- er резолв текущего файла в дереве файлов
- M-b тогл обозревателя файлов
- F5, F8, F9, F10, F11, S-F5, S-F11 отладчик
- space тогла фолда
- c, n, g, [, ], d, a LazyGit
- функциональность вима
- /fg, /ff телескоп
- /p glow
- a, A, dF, h, j, k, l, J, K хоткеи в обозревателе

## TODO
- [X] Docker container
- [X] Readme
    - [X] Отладка
    - [X] Env воркспейса
    - [X] Glow
    - [X] Настройка CoC
    - [X] Установка с нуля
    - [*] Поиск файлов, грепа в директории которая выбрана, либо директории файла в которой он находится
    - [*] Что с MD файлами?
    - [*] Открытие эксплорера при открытии конкретного файла
    - [*] Fix render problem when saving golang files
    - [ ] Try to open file in existing window via nvr add custom function
    - [ ] Add generation links to repository
