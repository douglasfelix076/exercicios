// parte visual
clear
set scoreboard off
@ 00,00 to 24,79 double
@ 00,02 say 'exe23'

nNumeroSecreto := 5
nNumero        := 0

do while .t.
   @ 01,02 say 'Digite um numero de 1 a 10:'
   @ 01,30 get nNumero picture '99' valid nNumero >= 0 .and. nNumero <= 10
   read

   if (nNumero == nNumeroSecreto)
      exit
   endif

   @ 02,02 say 'Numero incorreto' color 'R/N'
   nNumero := 0
enddo

 @ 02,02 clear to 02,60 // apagar o 'numero incorreto' 
 @ 03,02 say 'Acertou.'
 
@ 23,02 say 'Pressione qualquer tecla para continuar...'
Inkey(0)