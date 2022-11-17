# Установка Nvim
## Отладка
Установить адаптеры:  
:VimspectorInstall  
Доки:  
https://pepa.holla.cz/2021/03/01/golang-debugging-application-in-neovim/  
https://github.com/microsoft/vscode-go/issues/318--
## Настройка CoC
CocInstall
TSInstall
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
    - [ ] Установка с нуля
