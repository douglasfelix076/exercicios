clear

nNumeroA := 0
nNumeroB := 0

@ 00,01 say 'Digite o numero A: '
@ 01,01 say 'Digite o numero B: '
@ 00,20 get nNumeroA
@ 01,20 get nNumeroB
read

@ 03,01 say 'A + B: ' + str(nNumeroA + nNumeroB)
@ 04,01 say 'A - B: ' + str(nNumeroA - nNumeroB)
@ 05,01 say 'A * B: ' + str(nNumeroA * nNumeroB)
@ 06,01 say 'A / B: ' + str(nNumeroA / nNumeroB)
