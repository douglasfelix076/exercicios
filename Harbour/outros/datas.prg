set scoreboard off
set epoch to 1940
set date to british
clear
@ 00,00 to 24,79 double
@ 00,02 say 'datas'

cNome                     := Space(15)
dDataAniversario          := CToD('')
dDataProximoAniversario   := CToD('')
dDataAtual                := Date()
nAnoAtual                 := Year(dDataAtual)
nMesAtual                 := Month(dDataAtual)
nDiaAtual                 := Day(dDataAtual)
nAnoAniversario           := 0
nMesAniversario           := 0
nDiaAniversario           := 0
nSemanaAniversario        := 0
nAnoProximoAniversario    := 0
nSemanaProximoAniversario := 0
nDiasRestantes            := 0 
nMesesRestantes           := 0
nDiasNoMes                := 31
nIdade                    := 0
cMesExtenso               := 'janeiro'
cSemanaExtenso            := 'domingo'
cSemanaProximaExtenso     := 'domingo'
cSigno                    := 'aquario'

// mensagem de parabens
cParabensMensagem := ''
nParabensTamanho  := 0 // usado para centralizar a mensagem na tela

// calendario
nDiaSemanaInicial := 0 // muda a posicao horizontal do dia 1 no calendario
nLinha            := 0
nColuna           := 0
nDiaContador      := 0
cCorDia           := 'W/N'

// coleta de informacoes
@ 01,02 say 'Digite seu nome...............:'
@ 02,02 say 'Digite sua data de aniversario:'

@ 01,34 get cNome            valid !Empty(cNome)
@ 02,34 get dDataAniversario valid !Empty(dDataAniversario) .and. dDataAniversario < Date()
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

nAnoProximoAniversario    := Year(dDataProximoAniversario)
nSemanaProximoAniversario := DoW(dDataProximoAniversario)

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
   cMesExtenso := 'dezembro'
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

if nSemanaProximoAniversario == 2
   cSemanaProximaExtenso := 'segunda-feira'
elseif nSemanaProximoAniversario == 3
   cSemanaProximaExtenso := 'terca-feira'
elseif nSemanaProximoAniversario == 4
   cSemanaProximaExtenso := 'quarta-feira'
elseif nSemanaProximoAniversario == 5
   cSemanaProximaExtenso := 'quinta-feira'
elseif nSemanaProximoAniversario == 6
   cSemanaProximaExtenso := 'sexta-feira'
elseif nSemanaProximoAniversario == 7
   cSemanaProximaExtenso := 'sabado'
endif

// RESULTADOS
@ 04,02 say 'Data de nascimento em extenso.......: ' + AllTrim(Str(nDiaAniversario)) + ' de ' + cMesExtenso + ' de ' + AllTrim(Str(nAnoAniversario))
@ 05,02 say 'Dia da semana de nascimento.........: ' + cSemanaExtenso
@ 06,02 say 'Idade...............................: ' + AllTrim(Str(nIdade))
@ 07,02 say 'Signo...............................: ' + cSigno
@ 08,02 say 'Proximo aniversario em..............: ' + AllTrim(Str(nMesesRestantes)) + ' meses e ' + AllTrim(Str(nDiasRestantes)) + ' dias'
@ 09,02 say 'Dia da semana do proximo aniversario: ' + cSemanaProximaExtenso
@ 10,02 say 'Calendario do proximo aniversario...:'

// calendario do mes
@ 11,42 say cMesExtenso
@ 11,58 say AllTrim(Str(nAnoProximoAniversario))
@ 10,40 to 19,63

// o 35(7x5) impede o resultado do modulo de ficar negativo
nDiaSemanaInicial := (((nSemanaProximoAniversario - nDiaAniversario) + 35) % 7)
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

   @ 13 + nLinha,42 + nColuna * 3 say nDiaContador picture '99' color cCorDia

   nColuna++
enddo

if (nDiaAniversario == nDiaAtual .and. nMesAniversario == nMesAtual)

   cParabensMensagem := 'Feliz aniversario ' + AllTrim(cNome) + '!'
   nParabensTamanho  := Len(cParabensMensagem)

   set color to 'W/G'
   @ 21,01 clear to 21,78
   @ 21,40 - nParabensTamanho/2 say cParabensMensagem
   set color to 'W/N'
endif

@ 23,02 say 'Pressione qualquer tecla para continuar...'
Inkey(0)