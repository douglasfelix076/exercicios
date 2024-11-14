do while .t.
clear
    @ 00,00 to 24,79 double
    @ 00,02 say 'exe15'

    cNome     := Space(20)
    nContador := 0

    @ 01,02 say 'Digite seu nome:'

    @ 01,19 get cNome picture '@!' valid !Empty(cNome)
    read

    if (LastKey() = 27)
        nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
        if (nOpcao = 1)
            exit
        endif
        loop
    endif

    do while nContador++ < 10
        @ 02 + nContador,02 say Str(nContador, 2) + ': ' + cNome
    enddo

    Inkey(0)
enddo