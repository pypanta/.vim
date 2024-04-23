vim9script

const file_type = &filetype

final languages = {
    'python': {
        'server': 'pylsp',
        'filetype': 'python',
        'path': '/home/panta/.local/share/virtualenvs/vezba-CgwJj5MS/bin/pylsp',
        'args': []
    },
    'javascript': {
        'server': 'tsserver',
        'filetype': ['javascript'],
        'path': '/home/panta/.local/share/vim-lsp-settings/servers/lspjs/node_modules/.bin/typescript-language-server',
        'args': ['--stdio']
    },
    'rust': {
        'server': 'rustanalyzer',
        'filetype': ['rust'],
        'path': '/home/panta/.cargo/bin/rust-analyzer',
        'args': ['--stdio'],
        'syncInit': v:true
    },
    'htmldjango': {
        'server': 'vscode-html-server',
        'filetype': ['htmldjango'],
        'path': '/home/panta/.local/share/vim-lsp-settings/servers/lspjs/node_modules/.bin/vscode-html-language-server',
        'args': ['--stdio']
    },
    'css': {
        'server': 'vscode-css-server',
        'filetype': ['css'],
        'path': '/home/panta/.local/share/vim-lsp-settings/servers/lspjs/node_modules/.bin/vscode-css-language-server',
        'args': ['--stdio']
    }
}

def AddLanguageServer(language: string)
    call g:LspAddServer([{name: languages[language]['server'],
        filetype: languages[language]['filetype'],
        path: languages[language]['path'],
        args: languages[language]['args'],
        syncInit: get(languages[language], 'syncInit', v:none)
    }])
enddef

if ! exists("g:loaded_lsp")
    packadd lsp
endif

final lspOpts = {
    noNewlineInCompletion: v:true,
}

call LspOptionsSet(lspOpts)

if match(['typescript'], file_type) >= 0
    languages['javascript']['filetype'] = ['typescript']
    AddLanguageServer('javascript')
else
    AddLanguageServer(file_type)
endif
