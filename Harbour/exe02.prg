do while .t.
	clear

	cNome  := Space(20)
	nIdade := 0
	nPeso  := 0

	@ 01,02 say 'Digite seu nome.:'
	@ 02,02 say 'Digite sua idade:'
	@ 03,02 say 'Digite seu peso.:'

	@ 01,20 get cNome  picture '@!'  valid !Empty(cNome)
	@ 02,20 get nIdade picture '999' valid nIdade > 0
	@ 03,20 get nPeso  picture '999' valid nPeso > 0
	read

	if (LastKey() = 27)
		nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
		if (nOpcao = 1)
		   exit
		endif
		loop
	endif

	@ 05,02 say 'Nome.: ' + cNome
	@ 06,02 say 'Idade: ' + AllTrim(Str(nIdade)) + ' anos'
	@ 07,02 say 'Peso.: ' + AllTrim(Str(nPeso)) + 'kg'

	inkey(0)
	clear
enddo