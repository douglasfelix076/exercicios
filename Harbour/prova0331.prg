// Douglas Felix dos Santos Moreira

set scoreboard off
set date to british
set epoch to 1940

// cores e mascaras
cMascaraDinheiro   := '@E 99.999,99'
cMascaraPercentual := '999'
cCorResultado      := 'BG+/N'

do while .t.
	clear
	@ 00,00 to 24,79 double

	nEmpregadosAnalisados       := 0
	nContador                   := 0
	nCancelar                   := .f. // caso o usuario cancele a pesquisa

	// dados
	nHomensTotal                := 0
	nMulheresTotal              := 0
	nHomensAposentados          := 0
	nMulheresAposentadas        := 0
	nHomensAdmitidosAntesDe2006 := 0
	nHomensComAdicional         := 0
	nMulheresAcimaDe85Anos      := 0
	nMulheresComReducao         := 0
   nRemuneracaoTotal           := 0
   nRemuneracaoTotalHomens     := 0
   nRemuneracaoTotalMulheres   := 0

	@ 01,02 say 'Quantos empregados serao analisados?'

	@ 01,39 get nEmpregadosAnalisados picture '99'
	read

	if LastKey() = 27
		nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
		if nOpcao == 1
			exit
		endif

		loop
	endif

   // pesquisa
	do while nContador < nEmpregadosAnalisados
		cNome                   := Space(20)
		cSexo                   := ' '
		dNascimento             := CToD('')
		dAdmissao               := CToD('')
		dDemissao               := CToD('')
		nSalarioBase            := 0
		nAdicionalNoturno       := 0
		nAdicionalInsalubridade := 0
		nRemuneracao            := 0
		nIdade                  := 0
		nAnosDeTrabalho         := 0
		nAdicional              := 0
		lRecebeAponsentadoria   := .f.

		@ 03,02 say 'Colaborador n' + AllTrim(Str(nContador))
		@ 04,02 say 'Nome...................: '
		@ 05,02 say 'Sexo...................:   [M]asculino [F]eminino'
		@ 06,02 say 'Data de nascimento.....: '
		@ 07,02 say 'Data de admissao.......: '
		@ 08,02 say 'Data de demissao.......: '
		@ 09,02 say 'Valor salario base.....: '
		@ 10,02 say 'Adicional noturno......:    %'
		@ 11,02 say 'Adicional insalubridade:    %'

		@ 04,27 get cNome                   picture '@!'               valid !Empty(cNome) 
		@ 05,27 get cSexo                   picture '@!'               valid cSexo $ 'MF'
		@ 06,27 get dNascimento                                        valid !Empty(dNascimento) .and. Year(dNascimento) <= Year(Date()) - 18
		@ 07,27 get dAdmissao                                          valid Year(dAdmissao) >= Year(dNascimento) + 18 .and. dAdmissao <= Date()
		@ 08,27 get dDemissao                                          valid dDemissao >= dAdmissao .and. dDemissao <= Date()
		@ 09,27 get nSalarioBase            picture cMascaraDinheiro   valid nSalarioBase > 0
		@ 10,27 get nAdicionalNoturno       picture cMascaraPercentual valid nAdicionalNoturno >= 0 .and. nAdicionalNoturno <= 100
		@ 11,27 get nAdicionalInsalubridade picture cMascaraPercentual valid nAdicionalInsalubridade >= 0 .and. nAdicionalInsalubridade <= 100
		read

		if LastKey() = 27
			nOpcao := Alert('O que deseja fazer?', { 'Cancelar', 'Retornar', 'Processar' })
         
         if nOpcao == 1
				nCancelar := .t.
				exit
			elseif nOpcao == 3
				exit
			endif

			loop
		endif
		
		nAdicional      += nAdicionalNoturno + nAdicionalInsalubridade
		nIdade          := Year(Date()) - Year(dNascimento)
		nAnosDeTrabalho := Year(dDemissao) - Year(dAdmissao)

		if cSexo == 'M' // homem
			nHomensTotal++

			if nIdade >= 59 .and. nAnosDeTrabalho >= 27
				nHomensAposentados++
            lRecebeAponsentadoria := .t.
			endif
         if Year(dAdmissao) < 2006
            nHomensAdmitidosAntesDe2006++
         endif
		else // mulher
			nMulheresTotal++

			if nIdade >= 55 .and. nAnosDeTrabalho >= 22
				nMulheresAposentadas++
            lRecebeAponsentadoria := .t.
			endif
			if nIdade > 85
				nMulheresAcimaDe85Anos++
			endif
		endif

      if lRecebeAponsentadoria

         // trabalhou em 2010 ou 2015
         if (Year(dAdmissao) <= 2010 .and. Year(dDemissao) >= 2010) .or. (Year(dAdmissao) <= 2015 .and. Year(dDemissao) >= 2015)
            nAdicional += 6

            if cSexo == 'M'
               nHomensComAdicional++
            endif
         endif
         
         // trabalhou entre 2012 e 2020
         if Year(dAdmissao) <= 2020 .and. Year(dDemissao) >= 2012
            nAdicional -= 2
            
            if cSexo == 'F'
               nMulheresComReducao++
            endif
         endif
         
         nRemuneracao      := nSalarioBase + (nSalarioBase * nAdicional / 100) 
         nRemuneracaoTotal += nRemuneracao

         if cSexo == 'M'
            nRemuneracaoTotalHomens += nRemuneracao
         else
            nRemuneracaoTotalMulheres += nRemuneracao
         endif
      endif
      
      @ 03,02 clear to 10,60
      nContador++
	enddo

	if nCancelar // se a pesquisa foi cancelada
		loop
	endif

	// calculos
	nPercentualHomens   := (nHomensAposentados * 100) / nHomensTotal 
	nPercentualMulheres := (nMulheresAposentadas * 100) / nMulheresTotal

	// quadro final
	clear
	@ 00,00 to 24,79 double
	@ 01,02 say 'Numero de colaboradores entrevistados:'
	@ 03,02 say 'Numero de homens entrevistados.......:'
	@ 04,02 say 'Numero de mulheres entrevistadas.....:'
	@ 06,02 say 'Percentual de homens aposentados.....:'
	@ 07,02 say 'Percentual de mulheres aposentadas...:'
	@ 09,02 say 'Remuneracao total homens.............:'
	@ 10,02 say 'Remuneracao total mulheres...........:'
	@ 11,02 say 'Remuneracao total....................:'
	@ 13,02 say 'Mulheres acima de 25 anos............:'
	@ 14,02 say 'Homens admitidos antes de 2006.......:'
	@ 15,02 say 'Homens que receberam adicional.......:'
	@ 16,02 say 'Mulheres que tiveram reducao.........:'
	
	@ 01,41 say AllTrim(Str(nContador))                                               color cCorResultado
	@ 03,41 say AllTrim(Str(nHomensTotal))                                            color cCorResultado
	@ 04,41 say AllTrim(Str(nMulheresTotal))                                          color cCorResultado
	@ 06,41 say AllTrim(Transform(nPercentualHomens, cMascaraPercentual)) + '%'       color cCorResultado
	@ 07,41 say AllTrim(Transform(nPercentualMulheres, cMascaraPercentual)) + '%'  	  color cCorResultado
	@ 09,41 say AllTrim(Transform(nRemuneracaoTotalHomens, cMascaraDinheiro)) + '$'   color cCorResultado
	@ 10,41 say AllTrim(Transform(nRemuneracaoTotalMulheres, cMascaraDinheiro)) + '$' color cCorResultado
	@ 11,41 say AllTrim(Transform(nRemuneracaoTotal, cMascaraDinheiro)) + '$'         color cCorResultado
	@ 13,41 say AllTrim(Str(nMulheresAcimaDe85Anos))                                  color cCorResultado
	@ 14,41 say AllTrim(Str(nHomensAdmitidosAntesDe2006))                             color cCorResultado
	@ 15,41 say AllTrim(Str(nHomensComAdicional))                                     color cCorResultado
	@ 16,41 say AllTrim(Str(nMulheresComReducao))                                     color cCorResultado

	Inkey(0)
enddo