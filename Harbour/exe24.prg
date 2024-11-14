set scoreboard off
clear
@ 00,00 to 24,79
@ 00,02 say 'exe24'

cFruta := Space(20)

do while .t.
   @ 01,02 say 'Digite uma fruta:'
   @ 01,20 get cFruta picture '@!' valid !Empty(cFruta)
   read

   if (AllTrim(cFruta) == 'BANANA')
      exit
   endif

   @ 02,02 say 'Fruta incorreta' color 'R/N'
   cFruta := Space(20)
enddo

@ 02,02 clear to 02,60 // apagar o 'Fruta incorreta' 
@ 03,02 say 'Acertou.'

@ 23,02 say 'Pressione qualquer tecla para continuar...'
Inkey(0)