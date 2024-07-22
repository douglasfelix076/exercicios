// Douglas Felix dos Santos Moreira

set epoch to 1940
set date to british
set scoreboard off
set color to 'N/W+'

do while .t.
   // Data
   cNome          := Space(40)
   cSigno         := 'Aquario'
   cMes           := 'Janeiro'
   cSemana        := 'Domingo'
   cProximaSemana := 'Domingo'
   cMesAtual      := 'Janeiro'
   cDataExtenso   := ''
   dNascimento    := CToD('')
   nDiasNoMes     := 31

   clear

   @ 01,01 say 'Nome...............:'
   @ 02,01 say 'Data de nascimento.:'

   @ 01,21 get cNome       picture '@!' valid !Empty(cNome)
   @ 02,21 get dNascimento              valid dNascimento <= Date()
   read

   clear

   nAno      := Year(dNascimento)
   nMes      := Month(dNascimento)
   nDia      := Day(dNascimento)
   nSemana   := DoW(dNascimento)
   nIdadeAno := Year(Date()) - Year(dNascimento)
   nIdadeMes := Month(Date()) - Month(dNascimento)
   nIdadeDia := Day(Date()) - Day(dNascimento)
   dProximo  := CToD(Transform(Day(dNascimento), '99') + '/' + Transform(Month(dNascimento), '99')  + '/' + Transform(Year(Date()), '9999') )

   if (nIdadeMes <= 0)
      nIdadeMes += 12
   endif

   if (dProximo <= Date())
      dProximo := CToD(Transform(Day(dNascimento), '99') + '/' + Transform(Month(dNascimento), '99')  + '/' + Transform(Year(Date())+1, '9999') )
   endif

   nProximaSemana := DoW(dProximo)
   nProximoMes    := nMes - Month(Date())
   nProximoDia    := Day(Date()) - nDia

   if (nProximoMes <= 0)
      nProximoMes += 12
   endif

   if (nMes = 2)
      cMes       := 'Fevereiro'
      nDiasNoMes := 28
   elseif (nMes = 3)
      cMes       := 'Marco'
      nDiasNoMes := 31
   elseif (nMes = 4)
      cMes       := 'Abril'
      nDiasNoMes := 30
   elseif (nMes = 5)
      cMes       := 'Maio'
      nDiasNoMes := 31
   elseif (nMes = 6)
      cMes       := 'Junho'
      nDiasNoMes := 30
   elseif (nMes = 7)
      cMes       := 'Julho'
      nDiasNoMes := 31
   elseif (nMes = 8)
      cMes       := 'Agosto'
      nDiasNoMes := 31
   elseif (nMes = 9)
      cMes       := 'Setembro'
      nDiasNoMes := 30
   elseif (nMes = 10)
      cMes       := 'Outubro'
      nDiasNoMes := 31
   elseif (nMes = 11)
      cMes       := 'Novembro'
      nDiasNoMes := 30
   elseif (nMes = 12)
      cMes       := 'Dezembro'
      nDiasNoMes := 31
   endif

   if (nSemana = 2)
      cSemana := 'Segunda-feira'
   elseif (nSemana = 3)
      cSemana := 'Terca-feira'
   elseif (nSemana = 4)
      cSemana := 'Quarta-feira'
   elseif (nSemana = 5)
      cSemana := 'Quinta-feira'
   elseif (nSemana = 6)
      cSemana := 'Sexta-feira'
   elseif (nSemana = 7)
      cSemana := 'Sabado'
   endif

   if (nProximaSemana = 2)
      cProximaSemana := 'Segunda-feira'
   elseif (nProximaSemana = 3)
      cProximaSemana := 'Terca-feira'
   elseif (nProximaSemana = 4)
      cProximaSemana := 'Quarta-feira'
   elseif (nProximaSemana = 5)
      cProximaSemana := 'Quinta-feira'
   elseif (nProximaSemana = 6)
      cProximaSemana := 'Sexta-feira'
   elseif (nProximaSemana = 7)
      cProximaSemana := 'Sabado'
   endif

   if ((nMes = 1 .and. nDia > 21) .or. (nMes = 2 .and. nDia < 18))
      cSigno := 'Aquario'
   elseif ((nMes = 2 .and. nDia > 19) .or. (nMes = 3 .and. nDia < 20))
      cSigno := 'Peixes'
   elseif ((nMes = 3 .and. nDia > 21) .or. (nMes = 4 .and. nDia < 20))
      cSigno := 'Aries'
   elseif ((nMes = 4 .and. nDia > 21) .or. (nMes = 5 .and. nDia < 20))
      cSigno := 'Touro'
   elseif ((nMes = 5 .and. nDia > 21) .or. (nMes = 6 .and. nDia < 20))
      cSigno := 'Gemeos'
   elseif ((nMes = 6 .and. nDia > 21) .or. (nMes = 7 .and. nDia < 22))
      cSigno := 'Cancer'
   elseif ((nMes = 7 .and. nDia > 23) .or. (nMes = 8 .and. nDia < 22))
      cSigno := 'Leao'
   elseif ((nMes = 8 .and. nDia > 23) .or. (nMes = 9 .and. nDia < 22))
      cSigno := 'Virgem'
   elseif ((nMes = 9 .and. nDia > 23) .or. (nMes = 10 .and. nDia < 22))
      cSigno := 'Libra'
   elseif ((nMes = 10 .and. nDia > 23) .or. (nMes = 11 .and. nDia < 21))
      cSigno := 'Escorpiao'
   elseif ((nMes = 11 .and. nDia > 22) .or. (nMes = 12 .and. nDia < 21))
      cSigno := 'Sagitario'
   elseif ((nMes = 12 .and. nDia > 22) .or. (nMes = 1 .and. nDia < 20))
      cSigno := 'Capricornio'
   endif

   @ 01,01 say 'Nascido em................: ' + AllTrim(Str(nDia)) + ' de ' + cMes + ' de ' + Transform(nAno, '9999')                                                     color 'N/W'
   @ 02,01 say 'Nascido em uma............: ' + cSemana                                                                                                                   color 'N/W'
   @ 03,01 say 'Idade de..................: ' + Transform(nIdadeAno,'99') + ' anos ' + Transform(nIdadeMes, '99') + ' meses e ' + Transform(nIdadeDia, '9999') +  ' dias' color 'N/W'
   @ 04,01 say 'Signo.....................: ' + cSigno                                                                                                                    color 'N/W'
   @ 05,01 say 'Proximo aniversario em....: ' + Transform(nProximoMes, '99') + ' meses e ' + Transform(nProximoDia, '99') + ' dias'                                       color 'N/W'
   @ 06,01 say 'Proximo aniversario em uma: ' + cProximaSemana                                                                                                            color 'N/W'
   @ 07,01 say 'Calendario................: ' + cMes + ' de ' + AllTrim(Str(Year(dProximo)))                                                                              color 'N/W'

   nContador  := 1
   nContadorX := nProximaSemana
   nContadorY := 1

   @ 09,28 say ' D  S  T  Q  Q  S  S'
   do while nContador <= nDiasNoMes

      if (nContadorX >= 7)
         nContadorX := 1
         nContadorY++
      endif

      do while nContadorX <= 7 .and. nContador <= nDiasNoMes
         cCor := 'N/W'
         if (nContador = nDia)
            cCor := 'W/R'
         endif
         @ 09+nContadorY,25+nContadorX * 3 say nContador picture '99' color cCor

         nContador++
         nContadorX++
      enddo
   enddo

   if (Day(Date()) = nDia .and. Month(Date()) = nMes)
      set color to 'G/G'
      @ 20,00 clear to 20,79
      @ 20,20 say 'PARABENS ' + AllTrim(cNome) + ' HOJE E SEU ANIVERSARIO' color 'W/G'
      set color to 'N/W'
   endif

   Inkey(0)
enddo
