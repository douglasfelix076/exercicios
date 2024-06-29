clear

nNumeroA := 10
nNumeroB := 5

@ 01,01 say "Numero A: " +  str(nNumeroA) + "."
@ 02,01 say "Numero B: " +  str(nNumeroB) + "."

nNumeroTemporario := nNumeroA
nNumeroA := nNumeroB
nNumeroB := nNumeroTemporario

@ 04,01 say "Numeros trocados."
@ 05,01 say "Numero A: " + str(nNumeroA) + "."
@ 06,01 say "Numero B: " + str(nNumeroB) + "."
