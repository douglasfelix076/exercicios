set scoreboard off
set epoch to 1940
set date to british
clear

@ 00,00 to 24,79 double
@ 00,02 say 'datas'

dDataAniversario        := CToD('')
dDataProximoAniversario := CToD('')
dDataAtual              := Date()
nAnoAtual               := Year(dDataAtual)
nMesAtual               := Month(dDataAtual)
nDiaAtual               := Day(dDataAtual)
nAnoAniversario         := 0
nMesAniversario         := 0
nDiaAniversario         := 0
nSemanaAniversario      := 0
nAnoProximo             := 0
nSemanaProximo          := 0
nDiasRestantes          := 0 
nMesesRestantes         := 0
nDiasNoMes              := 31
cMesExtenso             := 'janeiro'
cSemanaExtenso          := 'domingo'
cSemanaProximaExtenso   := 'domingo'
cSigno                  := "aquario"
nIdade                  := 0

// calendario
nDiaSemanaInicial := 0 // 
nLinha            := 0
nColuna           := 0
nDiaContador      := 0
cCorDia           := 'W/N'

@ 01,02 say 'Digite sua data de aniversario:'

@ 01,34 get dDataAniversario valid dDataAniversario <= Date()
read

nAnoAniversario    := Year(dDataAniversario)
nMesAniversario    := Month(dDataAniversario)
nDiaAniversario    := Day(dDataAniversario)
nSemanaAniversario := DoW(dDataAniversario)
nIdade             := nAnoAtual - nAnoAniversario

if (nMesAtual < nMesAniversario .or. (nMesAtual == nMesAniversario .and. nDiaAtual < nDiaAniversario))
   nIdade--
   
   dDataProximoAniversario := CToD(Str(nDiaAniversario, 2) + '/' + Str(nMesAniversario, 2) + '/' + AllTrim(Str(nAnoAtual)))
else
   dDataProximoAniversario := CToD(Str(nDiaAniversario, 2) + '/' + Str(nMesAniversario, 2) + '/' + AllTrim(Str(nAnoAtual+1)))
endif

nAnoProximo    := Year(dDataProximoAniversario)
nSemanaProximo := DoW(dDataProximoAniversario)

if nMesAniversario == 2
   cMesExtenso := 'fevereiro'
   nDiasNoMes  := 28
elseif nMesAniversario == 3
   cMesExtenso := 'marco'
   nDiasNoMes  := 31
elseif nMesAniversario == 4
   cMesExtenso := 'abril'
   nDiasNoMes  := 30
elseif nMesAniversario == 5
   cMesExtenso := 'maio'
   nDiasNoMes  := 31
elseif nMesAniversario == 6
   cMesExtenso := 'junho'
   nDiasNoMes  := 30
elseif nMesAniversario == 7
   cMesExtenso := 'julho'
   nDiasNoMes  := 31
elseif nMesAniversario == 8
   cMesExtenso := 'agosto'
   nDiasNoMes  := 31
elseif nMesAniversario == 9
   cMesExtenso := 'setembro'
   nDiasNoMes  := 30
elseif nMesAniversario == 10
   cMesExtenso := 'outubro'
   nDiasNoMes  := 31
elseif nMesAniversario == 11
   cMesExtenso := 'novembro'
   nDiasNoMes  := 30
elseif nMesAniversario == 12
   cMesExtenso := 'desembro'
   nDiasNoMes  := 31
endif

nMesesRestantes = nMesAniversario - nMesAtual
if nMesesRestantes < 0
   nMesesRestantes += 12
endif
nDiasRestantes = nDiaAniversario - nDiaAtual
if nDiasRestantes < 0
   nDiasRestantes += nDiasNoMes
   nMesesRestantes--
endif

// signos
if ((nMesAniversario == 2 .and. nDiaAniversario >= 19) .or. (nMesAniversario == 3 .and. nDiaAniversario <= 20))
   cSigno = 'peixes'
elseif ((nMesAniversario == 3 .and. nDiaAniversario >= 21) .or. (nMesAniversario == 4 .and. nDiaAniversario <= 20))
   cSigno = 'aries'
elseif ((nMesAniversario == 4 .and. nDiaAniversario >= 21) .or. (nMesAniversario == 5 .and. nDiaAniversario <= 20))
   cSigno = 'touro'
elseif ((nMesAniversario == 5 .and. nDiaAniversario >= 21) .or. (nMesAniversario == 6 .and. nDiaAniversario <= 20))
   cSigno = 'gemeos'
elseif ((nMesAniversario == 6 .and. nDiaAniversario >= 21) .or. (nMesAniversario == 7 .and. nDiaAniversario <= 22))
   cSigno = 'cancer'
elseif ((nMesAniversario == 7 .and. nDiaAniversario >= 23) .or. (nMesAniversario == 8 .and. nDiaAniversario <= 22))
   cSigno = 'leao'
elseif ((nMesAniversario == 8 .and. nDiaAniversario >= 23) .or. (nMesAniversario == 9 .and. nDiaAniversario <= 22))
   cSigno = 'virgem'
elseif ((nMesAniversario == 9 .and. nDiaAniversario >= 23) .or. (nMesAniversario == 10 .and. nDiaAniversario <= 22))
   cSigno = 'libra'
elseif ((nMesAniversario == 10 .and. nDiaAniversario >= 23) .or. (nMesAniversario == 11 .and. nDiaAniversario <= 21))
   cSigno = 'escorpiao'
elseif ((nMesAniversario == 11 .and. nDiaAniversario >= 22) .or. (nMesAniversario == 12 .and. nDiaAniversario <= 21))
   cSigno = 'sagitario'
elseif ((nMesAniversario == 12 .and. nDiaAniversario >= 22) .or. (nMesAniversario == 1 .and. nDiaAniversario <= 20))
   cSigno = 'capricornio'
endif

if nSemanaAniversario == 2
   cSemanaExtenso := 'segunda-feira'
elseif nSemanaAniversario == 3
   cSemanaExtenso := 'terca-feira'
elseif nSemanaAniversario == 4
   cSemanaExtenso := 'quarta-feira'
elseif nSemanaAniversario == 5
   cSemanaExtenso := 'quinta-feira'
elseif nSemanaAniversario == 6
   cSemanaExtenso := 'sexta-feira'
elseif nSemanaAniversario == 7
   cSemanaExtenso := 'sabado'
endif

if nSemanaProximo == 2
   cSemanaProximaExtenso := 'segunda-feira'
elseif nSemanaProximo == 3
   cSemanaProximaExtenso := 'terca-feira'
elseif nSemanaProximo == 4
   cSemanaProximaExtenso := 'quarta-feira'
elseif nSemanaProximo == 5
   cSemanaProximaExtenso := 'quinta-feira'
elseif nSemanaProximo == 6
   cSemanaProximaExtenso := 'sexta-feira'
elseif nSemanaProximo == 7
   cSemanaProximaExtenso := 'sabado'
endif

// RESULTADOS
@ 03,02 say 'Data de nascimento em extenso.......: ' + AllTrim(Str(nDiaAniversario)) + ' de ' + cMesExtenso + ' de ' + AllTrim(Str(nAnoAniversario))
@ 04,02 say 'Dia da semana de nascimento.........: ' + cSemanaExtenso
@ 05,02 say 'Idade...............................: ' + AllTrim(Str(nIdade))
@ 06,02 say 'Signo...............................: ' + cSigno
@ 07,02 say 'Proximo aniversario em..............: ' + AllTrim(Str(nMesesRestantes)) + ' meses e ' + AllTrim(Str(nDiasRestantes)) + ' dias'
@ 08,02 say 'Dia da semana do proximo aniversario: ' + cSemanaProximaExtenso
@ 11,02 say 'Calendario do proximo aniversario...:'

// calendario do mes
@ 12,42 say cMesExtenso
@ 12,58 say AllTrim(Str(nAnoProximo))
@ 11,40 to 20,63

nDiaSemanaInicial := (((nSemanaProximo - nDiaAniversario) + 28) % 7)
nColuna           := nDiaSemanaInicial

do while nDiaContador++ < nDiasNoMes
   nPosicao := (nDiaContador - 1 + nDiaSemanaInicial)
   if nPosicao % 7 == 0
      nLinha++
   endif
   if nColuna == 7
      nColuna := 0
   endif

   if nDiaContador == nDiaAniversario
      cCorDia := 'W/R'
   elseif nPosicao % 7 == 0 .or. nPosicao % 7 == 6 
      cCorDia := 'N+/N'
   else 
      cCorDia := 'W/N'
   endif

   @ 14 + nLinha,42 + nColuna * 3 say nDiaContador picture '99' color cCorDia

   nColuna++
enddo

@ 23,02 say 'Pressione qualquer tecla para continuar...'
Inkey(0)