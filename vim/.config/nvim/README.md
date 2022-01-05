# Установка Nvim
## Отладка
Установить адаптеры:  
:VimspectorInstall  
Доки:  
https://pepa.holla.cz/2021/03/01/golang-debugging-application-in-neovim/  
https://github.com/microsoft/vscode-go/issues/318--
## Настройка CoC
## Python
Ставим в системе pyright  
В нужно окружении ставим плагины neovim, pynvim  
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

## TODO
- [X] Docker container
- [X] Readme
    - [X] Отладка
    - [X] Env воркспейса
    - [X] Glow
    - [X] Настройка CoC
    - [ ] Установка с нуля
