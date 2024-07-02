clear

nNumeroA := 0
nNumeroB := 0

@ 01,00 say "Numero A: "
@ 02,00 say "Numero B: "
@ 01,10 get nNumeroA
@ 02,10 get nNumeroB
read

@ 04,01 say "Numero A: " + str(nNumeroA) + "."
@ 05,01 say "Numero B: " + str(nNumeroB) + "."

nNumeroTemporario := nNumeroA
nNumeroA := nNumeroB
nNumeroB := nNumeroTemporario

@ 06,01 say "Numeros trocados."
@ 07,01 say "Numero A: " + str(nNumeroA) + "."
@ 08,01 say "Numero B: " + str(nNumeroB) + "."
