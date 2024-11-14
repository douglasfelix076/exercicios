set scoreboard off
clear
@ 00,00 to 24,79 double
@ 00,02 say 'exe21'

// info
nMenorPeso     := 0
nMaiorPeso     := 0
cNomeMaisMagro := ''
cNomeMaisGordo := ''

// contagem
nNumeroDePessoas := 6
cNome            := Space(20)
nPeso            := 0
nContador        := 0

do while nContador++ < nNumeroDePessoas
   
   // reseta os valores
   cNome := Space(20)
   nPeso := 0

   @ 01,02 clear to 02,60 // apaga a informação da pessoa anterior
   @ 01,02 say 'n' + alltrim(str(nContador))
   @ 02,02 say 'Digite o seu nome:'
   @ 03,02 say 'Digite o seu peso:'
   @ 02,25 get cNome picture '@!' valid !Empty(cNome)
   @ 03,25 get nPeso picture '@!' valid nPeso > 0
   read

   // automaticamente deixa a primeira pessoa como maior/menor peso
   if (nContador == 1)
      nMaiorPeso     := nPeso
      nMenorPeso     := nPeso
      cNomeMaisGordo := cNome
      cNomeMaisMagro := cNome
   else
      if (nMaiorPeso < nPeso)
         nMaiorPeso     := nPeso
         cNomeMaisGordo := cNome
      endif
      if (nMenorPeso > nPeso)
         nMenorPeso     := nPeso
         cNomeMaisMagro := cNome
      endif
   endif
enddo

@ 01,02 clear to 03,60

@ 01,02 say 'Mais gordo: ' + cNomeMaisGordo + '| Peso: ' + AllTrim(Str(nMaiorPeso))
@ 02,02 say 'Mais magro: ' + cNomeMaisMagro + '| Peso: ' + AllTrim(Str(nMenorPeso))

@ 23,02 say 'Pressione qualquer tecla para continuar...'
Inkey(0)