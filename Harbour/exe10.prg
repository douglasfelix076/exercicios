do while .t.
	clear
	nIdade := 0

	@ 01,02 say 'Digite a sua idade:'

	@ 01,22 get nIdade picture '999' valid nIdade > 0
	read

    if (LastKey() = 27)
        nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
        if (nOpcao = 1)
        	exit
        endif
        loop
    endif

	if nIdade > 21
		@ 03,02 say 'Usuario tem mais de 21 anos.'
	else
		@ 03,02 say 'Usuario tem menos de 21 anos.'
	endif

	Inkey(0)
enddo