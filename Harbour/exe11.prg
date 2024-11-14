do while .t.
    clear

    cNome          := Space(20)
    nIdade         := 0
    cClassificacao := ''

    @ 01,02 say 'Nome do nadador.:'
    @ 02,02 say 'Idade do nadador:'

    @ 01,20 get cNome  picture '@!'  valid !Empty(cNome)
    @ 02,20 get nIdade picture '999' valid nIdade >= 1
    read

    if (LastKey() = 27)
        nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
        if (nOpcao = 1)
        	exit
        endif
        loop
    endif

    if (nIdade <= 4) // 1-5
        cClassificacao := 'Nenhum'
    elseif (nIdade <= 7) // 5-7
        cClassificacao := 'Infantil A'
    elseif (nIdade <= 10) // 8-10
        cClassificacao := 'Infantil B'
    elseif (nIdade <= 13) // 11-13
        cClassificacao := 'Juvenil A'
    elseif (nIdade <= 17) // 14-17
        cClassificacao := 'Juvenil B'
    else // 18+
        cClassificacao := 'Senior'
    endif

    @ 04,02 say 'Nadador......: ' + AllTrim(cNome) + '.'
    @ 05,02 say 'Classificacao: ' + cClassificacao + '.'

    Inkey(0)
enddo