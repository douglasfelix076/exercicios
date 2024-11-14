// Douglas Felix dos Santos Moreira

cLetrasPermitidas := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

do while .t.
   // dados do jogo
   cNome         := Space(20)
   cPalavraChave := Space(20)
   nDificuldade  := 0
   cDicaA        := Space(30)
   cDicaB        := Space(30)
   cDicaC        := Space(30)

   cLetrasUsadas  := ''
   nChances       := 6
   nContador      := 0
   lPalavraValida := .t.
   
   clear
   @ 00,00 to 24,79 double   
   @ 02,02 say 'Participante..:'
   @ 03,02 say 'Palavra Chave.:'
   @ 04,02 say 'Dificuldade...:'
   
   @ 02,18 get cNome         picture '@!' valid !Empty(cNome)
   @ 03,18 get cPalavraChave picture '@!' valid !Empty(cPalavraChave)
   read

   if LastKey() == 27
      nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
      if nOpcao == 1
         exit
      endif

      loop
   endif

   // palavra chave
   cPalavraChave := AllTrim(cPalavraChave)

   do while nContador++ < Len(cPalavraChave)
      cLetra := SubStr(cPalavraChave, nContador, 1)
      
      if cLetra != ' ' .and. !(cLetra $ cLetrasPermitidas)
         Alert('A palavra chave possui caracteres invalidos.')
         lPalavraValida := .f.
         exit
      endif
   enddo
   
   if !lPalavraValida
      loop
   endif
   
   // dificuldade
   @ 04,18 prompt 'Facil'
   @ 04,24 prompt 'Medio'
   @ 04,30 prompt 'Dificil'
   menu to nDificuldade

   if LastKey() == 27
      loop
   endif

   if nDificuldade == 1
      @ 06,02 say 'Dica A:'
      @ 07,02 say 'Dica B:'
      @ 08,02 say 'Dica C:'
      
      @ 06,10 get cDicaA picture '@!' valid !Empty(cDicaA)
      @ 07,10 get cDicaB picture '@!' valid !Empty(cDicaB)
      @ 08,10 get cDicaC picture '@!' valid !Empty(cDicaC)
      read
      
      if LastKey() == 27
         nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
         if nOpcao == 1
            exit
         endif

         loop
      endif
   else
      nChances -= nDificuldade-1
   endif


   // desenho do programa
   @ 01,01 clear to 23,78
   @ 01,20 to 23,20 double
   @ 09,21 to 09,78
   @ 07,22 to 07,40 color 'N+/N'
   
   // deixa os pés e/ou pernas desenhados por padrão quando a dificuldade não for facil
   if nDificuldade >= 2
      @ 06,28 say ' /  L '

      if nDificuldade >= 3
         @ 05,28 say '  /\  '
      endif
   endif

   do while .t.
      cLetraEscolhida := ' '
      nContador       := 0
      lGanhou         := .t.

      @ 02,02 say 'Proxima letra: '
      @ 03,02 say 'Chances......: ' + AllTrim(Str(nChances))
      @ 11,22 say 'Letras usadas: '
      @ 11,37 say cLetrasUsadas color 'BG+/N'
      
      /*
          ________
          ||    ||
          ||    ()
          ||   /||\
          ||  ° /\ °
         /  \  /  L
        ─|  |─────────────
      */
      if nChances == 5 // pes
         @ 06,28 say ' /  L '
      elseif nChances == 4 // pernas
         @ 05,28 say '  /\  '
      elseif nChances == 3 // corpo
         @ 04,30 say '||'
      elseif nChances == 2 // bracos
         @ 04,28 say ' /'
         @ 04,32 say '\ '
         @ 05,28 say 'o '
         @ 05,32 say ' o'
      elseif nChances == 1 // cabeça
         @ 03,28 say '  ()  '
      elseif nChances == 0 // forca
         @ 01,24 say '________' 
         @ 02,24 say '||    ||' 
         @ 03,24 say '||' 
         @ 04,24 say '||' 
         @ 05,24 say '||' 
         @ 06,23 say '/  \'
         @ 07,23 say '|  |'

         Alert('Jogadas esgotadas, Voce perdeu.')
         exit
      endif
      
      if nDificuldade == 1
         if nChances == 4
            @ 18,22 say 'Dica 1: ' + cDicaA
         elseif nChances == 3
            @ 19,22 say 'Dica 2: ' + cDicaB
         elseif nChances == 2
            @ 20,22 say 'Dica 3: ' + cDicaC
         endif
      endif

      // desenho da palavra chave
      do while nContador++ < Len(cPalavraChave)
         cLetra := SubStr(cPalavraChave, nContador, 1)
         cCor   := 'W/N'

         // se a letra não foi descoberta, desenha um _ no lugar
         if cLetra != ' ' .and. !(cLetra $ cLetrasUsadas)
            cLetra  := '_'
            cCor    := 'N+/N'
            lGanhou := .f.
         endif

         @ 02,35+nContador*2 say cLetra color cCor
      enddo

      if lGanhou
         Alert('Voce Ganhou!')
         exit
      endif

      @ 02,17 get cLetraEscolhida picture '@!' valid cLetraEscolhida $ cLetrasPermitidas
      read

      if LastKey() == 27
         nOpcao := Alert('Deseja sair?', { 'Sim', 'Nao' })
         if nOpcao == 1
            exit
         endif

         loop
      endif

      if cLetraEscolhida $ cLetrasUsadas
         @ 02,17 say cLetraEscolhida color 'W/R'
         Alert('Letra ja foi usada!')
         
         loop
      endif
      
      if !(cLetraEscolhida $ cPalavraChave)
         nChances--
      endif
      
      cLetrasUsadas += cLetraEscolhida
   enddo

   nOpcao := Alert('Deseja jogar novamente?', { 'Sim', 'Nao' })
   if nOpcao == 2
      exit
   endif
enddo