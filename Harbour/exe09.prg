do while .t.
    clear

    cLetra   := ' '
    dData    := CToD('')
    nInteiro := 0
    nDecimal := 0
    cString  := Space(20)

    @ 01,02 say 'Digite uma letra........:'
    @ 02,02 say 'Digite uma data.........:'
    @ 03,02 say 'Digite um numero inteiro:'
    @ 04,02 say 'Digite um numero decimal:'
    @ 05,02 say 'Digite uma string.......:'

    @ 01,28 get cLetra   picture '@!'     valid !Empty(cLetra)
    @ 02,28 get dData                     valid !Empty(dData)
    @ 03,28 get nInteiro picture '999'
    @ 04,28 get nDecimal picture '999.99'
    @ 05,28 get cString  picture '@!'     valid !Empty(cString)
    read

    if (LastKey() = 27)
        nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
        if (nOpcao = 1)
            exit
        endif
        loop
    endif

    @ 07,02 say 'Letra.........: ' + cLetra
    @ 08,02 say 'Data..........: ' + DToC(dData)
    @ 09,02 say 'Numero inteiro: ' + AllTrim(Str(nInteiro))
    @ 10,02 say 'Numero decimal: ' + AllTrim(Str(nDecimal))
    @ 11,02 say 'String........: ' + cString

    Inkey(0)
enddo