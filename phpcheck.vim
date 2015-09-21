"PHP语法检查插件 phpcheck.vim
"适用于w保存命令，不能用于wq保存退出命令
"安装路径 /usr/share/vim/vim73/plugin/phpcheck.vim

autocmd BufWritePost *.php call PHPSyntaxCheck()

if !exists('g:PHP_SYNTAX_CHECK_BIN')
    let g:PHP_SYNTAX_CHECK_BIN = 'php'
endif

function! PHPSyntaxCheck()
    let result = system(g:PHP_SYNTAX_CHECK_BIN.' -l -n '.expand('%'))
    if (stridx(result, 'No syntax errors detected') == -1)
        echohl WarningMsg | echo result | echohl None
    endif
endfunction
