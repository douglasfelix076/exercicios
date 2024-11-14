do while .t.
    clear

    nNumero1 := 0
    nNumero2 := 0

    @ 01,02 say 'Numero 1:'
    @ 02,02 say 'Numero 2:'

    @ 01,12 get nNumero1
    @ 02,12 get nNumero2
    read

    if (LastKey() = 27)
        nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
        if (nOpcao = 1)
            exit
        endif
        loop
    endif

    @ 04,02 say alltrim(str(nNumero1)) + ' + ' + alltrim(str(nNumero2)) + ': ' + alltrim(str(nNumero1 + nNumero2))
    @ 05,02 say alltrim(str(nNumero1)) + ' - ' + alltrim(str(nNumero2)) + ': ' + alltrim(str(nNumero1 - nNumero2))
    @ 06,02 say alltrim(str(nNumero1)) + ' / ' + alltrim(str(nNumero2)) + ': ' + alltrim(str(nNumero1 / nNumero2))
    @ 07,02 say alltrim(str(nNumero1)) + ' * ' + alltrim(str(nNumero2)) + ': ' + alltrim(str(nNumero1 * nNumero2))
enddo