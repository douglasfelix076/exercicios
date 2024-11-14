// Douglas felix dos Santos Moreira

set date to british
set epoch to 1940
set scoreboard off

cHistorico := ''

//cores
cCorAzul     := 'BG+/N'
cCorVermelho := 'R+/N'

clear
do while .t.
   cNome           := Space(20)
   nContador       := 0
   nScore          := 0
   cProximasTeclas := ''

   @ 00,00 to 02,78 double
   @ 01,01 say 'Player:'
   @ 01,09 get cNome picture '@!' valid !Empty(cNome)
   read
   
   if LastKey() == 27
      nOpcao := Alert('Deseja sair do jogo?', { 'Sim', 'Nao' })
      
      if nOpcao == 1
         exit
      endif
      
      loop
   endif

   clear
   @ 02,00 to 24,08 double
   @ 00,00 say 'PRESS ANY KEY TO START' color cCorAzul
   @ 01,00 say 'GAME ><)))°>'           color cCorAzul
   @ 23,01 say 'Q W E R'                color cCorAzul
   
   Inkey(0)
   
   @ 00,00 clear to 01,60

   // loop do jogo
   do while .t.
      nTecla    := 0
      nContador := 0
      cLetra    := ''
      
      @ 03,01 clear to 22,07
      @ 00,00 say 'Score: ' + AllTrim(Str(nScore)) color cCorAzul
      @ 22,01 to 22,07 color 'N+/N'
      
      // preenche a sequencia
      do while Len(cProximasTeclas) < 20
         nPosicaoAleatoria := hb_RandomInt(1, 4)
         cProximasTeclas   := SubStr('QWER', nPosicaoAleatoria, 1) + cProximasTeclas // adiciona novas teclas no inicio da sequencia
      enddo
            
      do while nContador++ < 20
         cLetra   := SubStr(cProximasTeclas, nContador, 1)
         nPosicao := 1

         if cLetra == 'W'
            nPosicao := 3
         elseif cLetra == 'E'
            nPosicao := 5
         elseif cLetra == 'R'
            nPosicao := 7
         endif
         @ 02+nContador,nPosicao say cLetra color cCorVermelho
      enddo

      nTecla := Inkey(1.0)

      if (cLetra == 'Q' .and. nTecla == 113) .or. (cLetra == 'W' .and. nTecla == 119) .or. (cLetra == 'E' .and. nTecla == 101) .or. (cLetra == 'R' .and. nTecla == 114)
         nScore++

         // remove a primeira tecla
         cProximasTeclas   := SubStr(cProximasTeclas, 0, Len(cProximasTeclas)-1)
      else // nenhuma tecla pressionada ou tecla incorreta
         Alert('Score: ' + AllTrim(Str(nScore)))

         exit
      endif
   enddo

   // se o historico ficar maior que 15
   // pontuações antigas são removidas
   if Len(cHistorico) / 27 >= 15
      cHistorico := SubStr(cHistorico, 28)
   endif
   cHistorico += cNome + ' - ' + Str(nScore, 4)

   clear
   @ 03,20 to 23,50 double
   @ 05,21 to 05,49 double
   @ 04,33 say 'History'

   nContador := 0
   do while nContador < 20
      @ 06+nContador,22 say SubStr(cHistorico, nContador * 27 + 1, 27) color 'N/W'
      nContador++
   enddo
enddo