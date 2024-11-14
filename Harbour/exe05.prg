do while .t.
    clear
    
    nNumeroA := 0
    nNumeroB := 0

    @ 01,02 say 'valor atual de A:'
    @ 02,02 say 'valor atual de B:'

    @ 01,20 get nNumeroA
    @ 02,20 get nNumeroB
    read

	if (LastKey() = 27)
		nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
		if (nOpcao = 1)
		   exit
		endif
		loop
	endif

    // troca
    nTemp    := nNumeroA
    nNumeroA := nNumeroB
    nNumeroB := nTemp

    @ 04,02 say 'novo valor de A: ' + AllTrim(Str(nNumeroA))
    @ 05,02 say 'novo valor de B: ' + AllTrim(Str(nNumeroB))

    @ 23,02 say 'Pressione qualquer tecla para continuar...'
    Inkey(0)
    clear
enddo