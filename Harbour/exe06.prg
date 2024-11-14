do while .t.
    clear

    nNumeroA := 0
    nNumeroB := 0
    nNumeroC := 0

    @ 01,02 say 'Numero A:'
    @ 02,02 say 'Numero B:'
    @ 03,02 say 'Numero C:'

    @ 01,12 get nNumeroA
    @ 02,12 get nNumeroB
    @ 03,12 get nNumeroC
    read

	if (LastKey() = 27)
		nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
		if (nOpcao = 1)
		   exit
		endif
		loop
	endif

    nMedia   := (nNumeroA + nNumeroB + nNumeroC) / 3

    @ 05,02 say 'A media entre os numeros ' + alltrim(str(nNumeroA)) + ', ' + alltrim(str(nNumeroB)) + ', e ' + alltrim(str(nNumeroC)) + ' eh ' + alltrim(str(nMedia)) + '.'

    Inkey(0)
    clear
enddo