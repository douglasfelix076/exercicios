// parte visual
clear
set scoreboard off
@ 00,00 to 24,79 double
@ 00,02 say 'exe16'

cNome          := Space(20)
nTamanhoNome   := 0
nRepetir       := 0
nContador      := 0
nHorizontal    := 0
nVertical      := 0
nPagina        := 0
nNomePorPagina := 0

@ 01,02 say 'Digite seu nome...........:'
@ 02,02 say 'Quantas vezes deve repetir:'

@ 01,30 get cNome    picture '@!' valid !Empty(cNome)
@ 02,30 get nRepetir picture '9999' valid nRepetir > 0
read

cNome          := AllTrim(cNome)
nTamanhoNome   := Len(cNome) + 7
nNomePorPagina := (76 / nTamanhoNome) - 1

do while nContador++ < nRepetir
    if (nVertical >= 18)
        nVertical   := 0
        nHorizontal++
        
        if (nHorizontal >= nNomePorPagina)
            
            @ 23,02 say 'Avancar para a proxima pagina...'
            Inkey(0)

            @ 03,02 clear to 23,78 // apaga a tela
            nHorizontal := 0
        endif
    endif

    @ 04 + nVertical, 02 + nHorizontal * nTamanhoNome say Str(nContador, 4) + ': ' + cNome

    nVertical++
enddo

@ 23,02 say 'Pressione qualquer tecla para continuar...'
Inkey(0)