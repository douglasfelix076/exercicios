// Douglas Felix dos Santos Moreira

set date to british
set epoch to 1940
set message to 23 center
set wrap on

nEscolha := 0

nCadastrosContador := 1
cCadastrosSenha    := '' // todas as senhas são armazenadas aqui
cCadastrosData     := '' // todas as datas são armazenadas aqui

// constantes
cNumeros             := '1234567890'
cLetrasMinusculas    := 'abcdefghijklmnopqrstuvwxyz'
cLetrasMaiusculas    := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
cCaracteresEspeciais := '¹!@#$%^&*()-+'

do while .t.
	clear
	@ 01,01 prompt 'Cadastrar' message 'Cadastrar senha'
	@ 02,01 prompt 'Consultar' message 'Consultar senha'
	@ 03,01 prompt 'Sair'      message 'Sair do programa'
	menu to nEscolha

	if nEscolha == 0 // ESC
		nEscolha := 3

	elseif nEscolha == 1 // Cadastrar
		do while .t.
			cSenha         := Space(12)
			cSenhaReal     := '' // cSenha com AllTrim()
			dCadastro      := CToD('')
			nContador      := 0

			// confirmações
			lContemNumero    := .f.
			lContemMaiusculo := .f.
			lContemMinusculo := .f.
			lContemEspecial  := .f.
	
			clear
			@ 01,01 say 'Codigo.........: ' + Transform(nCadastrosContador, '999')
			@ 02,01 say 'Senha..........:'
			@ 03,01 say 'Data cadastro..:'
	
			@ 02,18 get cSenha    valid !Empty(cSenha)
			@ 03,18 get dCadastro valid !Empty(dCadastro)
			read
			
			if LastKey() == 27
				nOpcao := Alert('Voltar?', { 'Sim', 'Nao' })
				if nOpcao == 1
					exit
				endif
	
				loop
			endif
			
			cSenhaReal := AllTrim(cSenha)

			// se a senha for muito pequena
			if Len(cSenhaReal) < 8
				Alert('Senha deve possuir pelo menos 8 caracteres. Tente novamente!')
				loop
			endif

			// loop iterando por cada letra checando se ela é um dos caracteres requisitados
			do while nContador++ < Len(cSenhaReal)
				cCaractere := SubStr(cSenhaReal, nContador, 1)
				
				if cCaractere $ cNumeros
					lContemNumero := .t.
				endif
				if cCaractere $ cLetrasMaiusculas
					lContemMaiusculo := .t.
				endif
				if cCaractere $ cLetrasMinusculas
					lContemMinusculo := .t.
				endif
				if cCaractere $ cCaracteresEspeciais
					lContemEspecial := .t.
				endif
			enddo
			
			// se a senha contem todos 1 de cada requisito (numero, maiusculo, minusculo, especial)
			if lContemNumero .and. lContemMaiusculo .and. lContemMinusculo .and. lContemEspecial
				nCadastrosContador++
				cCadastrosSenha += cSenha // salva a senha aos cadastros
				cCadastrosData  += DToC(dCadastro) // salva a data aos cadastros
			else
				Alert('Senha fraca. Tente novamente!')
			endif
		enddo

	elseif nEscolha == 2 // Consultar
		if nCadastrosContador == 1
			Alert('Nao existem senhas cadastradas.')
			loop
		endif

		do while .t.
			nCodigo := 0

			clear
			@ 01,01 say 'Codigo.........: '

			@ 01,18 get nCodigo picture '999' valid nCodigo > 0
			read
			
			if LastKey() == 27
				nOpcao := Alert('Voltar?', { 'Sim', 'Nao' })
				if nOpcao == 1
					exit
				endif
	
				loop
			endif
			
			if nCodigo >= nCadastrosContador
				Alert('Codigo ' + AllTrim(Str(nCodigo)) + ' nao cadastrado!')
				loop
			endif

			// informacoes desse cadastro
			cSenha := SubStr(cCadastrosSenha, 12 * (nCodigo - 1) + 1, 12)
			cData  := SubStr(cCadastrosData, 8 * (nCodigo - 1) + 1, 8)
			
			// desenho do calendario
			dData             := CToD(cData)
			nMes              := Month(dData)
			nDiasNoMes        := Day(CToD('01/' + Str(nMes+1, 2) + '/00') - 1)
			nDiaSemanaInicial := DoW(CToD('01/' + Str(nMes, 2) + '/' + SubStr(cData, 7, 2))) - 1 // dia da semana no primeiro dia do mes
			nColuna           := nDiaSemanaInicial
			nLinha            := 0
			nDiaContador      := 0
			nPosicaoSemana    := 0
			
			@ 02,01 say 'Senha..........: ' + cSenha
			@ 03,01 say 'Data cadastro..: ' + cData
			@ 05,28 say ' D  S  T  Q  Q  S  S'

			do while nDiaContador++ < nDiasNoMes
				nPosicaoSemana := (nDiaContador - 1 + nDiaSemanaInicial)
				
				// controle de linhas
				if nPosicaoSemana % 7 == 0
					nLinha++
				endif
				if nColuna == 7
					nColuna := 0
				endif
				
				if nDiaContador == Day(dData)
					cCorDia := 'N/R'
				else 
					cCorDia := 'N/W'
				endif
			
				@ 6+nLinha,28+nColuna * 3 say nDiaContador picture '99' color cCorDia
				@ 6+nLinha,28+DoW(CToD(Str(nDiaContador) + '/' + Str(nMes, 2) + '/' + SubStr(cData, 7, 2))) * 3 say nDiaContador picture '99' color cCorDia
			
				nColuna++
			enddo

			@ 23,01 say 'Pressiona qualquer tecla para continuar....'
			Inkey(0)
		enddo

	elseif nEscolha == 3 // Sair
		exit
		
	endif

enddo