// Douglas Felix dos Santos Moreira

set date to british
set epoch to 1940
clear
@ 00,00 to 24,79 double
@ 00,02 say 'COTACAO DE SEGUROS'

// dados do vendedor
cNomeVendedor := Space(30) 
dCotacao      := Date()

// dados pessoais
cNome           := Space(30)
nIdade          := 0
cSexo           := ' '
nAnoPrimeiraCNH := 0

// dados do veiculo
cMarca         := Space(20)
nAnoFabricacao := 0
cTipoVeiculo   := ' '
nMotor         := 0
nValorFipe     := 0
cUsoVeiculo    := ' '

nAnoAtual            := Year(Date())
nMesAtual            := Month(Date())
nUltimoDiaDoMes      := Day(CToD('01/' + Str(nMesAtual+1, 2) + '/00') - 1) // LastDayOM
cMesExtenso          := 'janeiro'
nSeg1ValorAnual      := 0
nSeg2ValorAnual      := 0
nValorBase           := 0
nAdicional           := 0 // adicional a ser calculado no valor final
nAdicionalFabricacao := 0 // adicional do ano de fabricacao
nAnosDesdeFabricacao := 0
nTempoDeHabilitacao  := 0 // tempo em anos

// cores
cCorSeg1 := 'W/R'
cCorSeg2 := 'W/R'

// vendedor
@ 01,02 say 'Informacoes do vendedor'
@ 02,02 say 'Vendedor........:'
@ 03,02 say 'Data da cotacao.:'

@ 02,20 get cNomeVendedor picture '@!' valid !Empty(cNomeVendedor)
@ 03,20 get dCotacao                   valid !Empty(dCotacao)
read

@ 05,02 say 'Informacoes pessoais'
@ 06,02 say 'Nome................:'
@ 07,02 say 'Idade...............:'
@ 08,02 say 'Sexo................:   [M]asculino [F]eminino'
@ 09,02 say 'Ano da primeira CNH.:'

@ 06,24 get cNome           picture '@!'   valid !Empty(cNome)
@ 07,24 get nIdade          picture '999'  valid nIdade >= 18
@ 08,24 get cSexo           picture '@!'   valid cSexo $ 'MF'
@ 09,24 get nAnoPrimeiraCNH picture '9999' valid nAnoPrimeiraCNH >= nAnoAtual - (nIdade - 18)
read

// veiculo
@ 11,02 say 'Informacoes do veiculo'
@ 12,02 say 'Marca...............:'
@ 13,02 say 'Ano de fabricacao...:'
@ 14,02 say 'Tipo................:   [P]asseio [E]sportivo [L]uxo'
@ 15,02 say 'Motor...............:'
@ 16,02 say 'Valor (Tabela Fipe).:'
@ 17,02 say 'Uso do veiculo......:   [P]articular pr[O]fissional'

@ 12,24 get cMarca         picture '@!'              valid !Empty(cMarca)
@ 13,24 get nAnoFabricacao picture '9999'            valid nAnoFabricacao <= nAnoAtual
@ 14,24 get cTipoVeiculo   picture '@!'              valid cTipoVeiculo $ 'PEL'
@ 15,24 get nMotor         picture '9.9'             valid nMotor > 0
@ 16,24 get nValorFipe     picture '@E 9,999,999.99' valid nValorFipe > 0
@ 17,24 get cUsoVeiculo    picture '@!'              valid cUsoVeiculo $ 'PO'
read

@ 01,01 clear to 23,78



// CALCULOS

nAnosDesdeFabricacao := nAnoAtual - nAnoFabricacao
nTempoDeHabilitacao  := nAnoAtual - nAnoPrimeiraCNH

// SEGURADORA 1

// idade
if nIdade < 25 .or. nIdade > 65
    nAdicional += 10
endif

// sexo
if cSexo == 'M'
    nAdicional += 10
else
    nAdicional -= 5
endif

// tempo de habilitaçao
if nTempoDeHabilitacao <= 3
    nAdicional += 15
elseif nTempoDeHabilitacao > 8
    nAdicional -= 10
endif

// tipo de veiculo
if cTipoVeiculo == 'E'
    nAdicional += 10
elseif cTipoVeiculo == 'L'
    nAdicional += 20
endif

// motor
if nMotor > 2.0
    nAdicional += 15
endif

// tempo de fabricacao
nAdicionalFabricacao := nAnosDesdeFabricacao * 0.5
if nAdicionalFabricacao > 10
    nAdicionalFabricacao := 10
endif

nAdicional += nAdicionalFabricacao

// uso profissional
if cUsoVeiculo == 'O'
    nAdicional += 10
endif

// cotacao
if Month(dCotacao) == 3
    nAdicional -= 10
endif

nValorBase      := nValorFipe * 6/100
nSeg1ValorAnual := nValorBase + (nValorBase * nAdicional/100)


// SEGURADORA 2
nAdicional := 0 // resetando o adicional

// idade
if nIdade < 23 .or. nIdade > 60
    nAdicional += 15
elseif nIdade >= 30 .and. nIdade <= 50
    nAdicional -= 8
endif

// sexo
if cSexo == 'M'
    nAdicional -= 6
else
    nAdicional += 12
endif

// tempo de habilitaçao
if nTempoDeHabilitacao <= 2
    nAdicional += 20
elseif nTempoDeHabilitacao > 5
    nAdicional -= 8
endif

// tipo de veiculo
if cTipoVeiculo == 'E'
    nAdicional += 15
elseif cTipoVeiculo == 'L'
    nAdicional += 18
endif

// motor
if nMotor >= 1.5
    nAdicional += 10
endif

// tempo de fabricacao
nAdicionalFabricacao := nAnosDesdeFabricacao * 0.8
if nAdicionalFabricacao > 8
    nAdicionalFabricacao := 8
endif

nAdicional += nAdicionalFabricacao

// uso profissional
if cUsoVeiculo == 'O'
    nAdicional += 12
endif

// cotacao
if Month(dCotacao) == 9
    nAdicional -= 8
endif

nValorBase      := nValorFipe * 7/100
nSeg2ValorAnual := nValorBase + (nValorBase * nAdicional/100)


// RELATORIO
if nSeg1ValorAnual < nSeg2ValorAnual
    cCorSeg1 := 'W/G'
else
    cCorSeg2 := 'W/G'
endif

// cores do fundo
set color to (cCorSeg1)
@ 03,02 clear to 07,38

set color to (cCorSeg2)
@ 03,41 clear to 07,77

set color to 'W/N'

// SEGURADORA 1
@ 02,01 to 08,39
@ 04,02 to 04,38                                                             color cCorSeg1
@ 03,02 say 'SEGUROS E CIA'                                                  color cCorSeg1
@ 05,02 say 'Mensal.....:' + Transform(nSeg1ValorAnual/12,   '9,999,999.99') color cCorSeg1
@ 06,02 say 'Trimestral.:' + Transform(nSeg1ValorAnual/12*3, '9,999,999.99') color cCorSeg1
@ 07,02 say 'Anual......:' + Transform(nSeg1ValorAnual,      '9,999,999.99') color cCorSeg1

// SEGURADORA 2
@ 02,40 to 08,78
@ 04,41 to 04,77                                                                color cCorSeg2
@ 03,41 say 'AUTO SEGUROS S A'                                                  color cCorSeg2
@ 05,41 say 'Mensal.....:' + Transform(nSeg2ValorAnual/12,   '@E 9,999,999.99') color cCorSeg2
@ 06,41 say 'Trimestral.:' + Transform(nSeg2ValorAnual/12*3, '@E 9,999,999.99') color cCorSeg2
@ 07,41 say 'Anual......:' + Transform(nSeg2ValorAnual,      '@E 9,999,999.99') color cCorSeg2

if nMesAtual == 2
	cMesExtenso := 'fevereiro'
elseif nMesAtual == 3
	cMesExtenso := 'marco'
elseif nMesAtual == 4
	cMesExtenso := 'abril'
elseif nMesAtual == 5
	cMesExtenso := 'maio'
elseif nMesAtual == 6
	cMesExtenso := 'junho'
elseif nMesAtual == 7
	cMesExtenso := 'julho'
elseif nMesAtual == 8
	cMesExtenso := 'agosto'
elseif nMesAtual == 9
	cMesExtenso := 'setembro'
elseif nMesAtual == 10
	cMesExtenso := 'outubro'
elseif nMesAtual == 11
	cMesExtenso := 'novembro'
elseif nMesAtual == 12
	cMesExtenso := 'dezembro'
endif

@ 10,2 say 'Cotacao valida ate ' + AllTrim(Str(nUltimoDiaDoMes)) + ' de ' + cMesExtenso + ' de ' + AllTrim(Str(nAnoAtual)) + '.'

Inkey(0)