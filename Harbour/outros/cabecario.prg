set scoreboard off
set epoch to 1940
set date to british

clear
@ 00,00 to 24,79 double

dData             := Date()
nDiaAtual         := Day(dData)
nMesAtual         := Month(dData)
nAnoAtual         := Year(dData)
nDiaSemanaAtual   := DoW(dData)
cMesExtenso       := 'Janeiro'
cDiaSemanaExtenso := 'Domingo'

if nMesAtual == 2
	cMesExtenso := 'Fevereiro'
elseif nMesAtual == 3
	cMesExtenso := 'Marco'
elseif nMesAtual == 4
	cMesExtenso := 'Abril'
elseif nMesAtual == 5
	cMesExtenso := 'Maio'
elseif nMesAtual == 6
	cMesExtenso := 'Junho'
elseif nMesAtual == 7
	cMesExtenso := 'Julho'
elseif nMesAtual == 8
	cMesExtenso := 'Agosto'
elseif nMesAtual == 9
	cMesExtenso := 'Setembro'
elseif nMesAtual == 10
	cMesExtenso := 'Outubro'
elseif nMesAtual == 11
	cMesExtenso := 'Novembro'
elseif nMesAtual == 12
	cMesExtenso := 'Dezembro'
endif

if nDiaSemanaAtual == 2
	cDiaSemanaExtenso := 'Segunda-feira'
elseif nDiaSemanaAtual == 3
	cDiaSemanaExtenso := 'Terca-feira'
elseif nDiaSemanaAtual == 4
	cDiaSemanaExtenso := 'Quarta-feira'
elseif nDiaSemanaAtual == 5
	cDiaSemanaExtenso := 'Quinta-feira'
elseif nDiaSemanaAtual == 6
	cDiaSemanaExtenso := 'Sexta-feira'
elseif nDiaSemanaAtual == 7
	cDiaSemanaExtenso := 'Sabado'
endif

@ 01,02 say 'Maringa, ' + AllTrim(Str(nDiaAtual)) + ' de ' + cMesExtenso + ' de ' + AllTrim(Str(nAnoAtual)) + ' (' + cDiaSemanaExtenso + ')'

Inkey(0)