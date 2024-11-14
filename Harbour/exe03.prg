clear

while .t.
    nNumeroA := 0
    nNumeroB := 0

    @ 01,02 say 'Numero A:'
    @ 02,02 say 'Numero B:'

    @ 01,12 get nNumeroA
    @ 02,12 get nNumeroB
    read

    if LastKey() = 27
        nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
        if nOpcao = 1
           exit
        endif
        loop
     endif

    nProduto := nNumeroA * nNumeroB

    @ 04,02 say 'O produto dos numeros ' + AllTrim(Str(nNumeroA)) + ' e ' + AllTrim(Str(nNumeroB)) + ' eh ' + AllTrim(Str(nProduto)) + '.'

    @ 23,02 say 'Pressione qualquer tecla para continuar...'
    inkey(0)
    clear
enddo