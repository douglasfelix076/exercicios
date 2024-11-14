do while .t.
	clear
	@ 00,00 to 24,79 double
	@ 00,02 say 'exe17'

	cPalavra          := Space(40)
	cPalavraInvertida := ''
	nTamanhoDaPalavra := 0
	nContador         := 0

	@ 01,02 say 'Digite um texto:'

	@ 01,19 get cPalavra valid !Empty(cPalavra)
	read

	if (LastKey() = 27)
		nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
		if (nOpcao = 1)
			exit
		endif
		loop
	endif

	cPalavra          := AllTrim(cPalavra) // remover os caracteres vazios
	nTamanhoDaPalavra := Len(cPalavra)

	do while nContador < nTamanhoDaPalavra
		cPalavraInvertida += SubStr(cPalavra, nTamanhoDaPalavra - nContador++, 1)
	enddo

	@ 03,02 say cPalavraInvertida

	Inkey(0)
enddo