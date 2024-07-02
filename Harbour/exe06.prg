clear

nNumero1 := 0
nNumero2 := 0
nNumero3 := 0

@ 00,00 say "Numero 1: "
@ 01,00 say "Numero 2: "
@ 02,00 say "Numero 3: "
@ 00,10 get nNumero1
@ 01,10 get nNumero2
@ 02,10 get nNumero3
read

nMedia := (nNumero1 + nNumero2 + nNumero3) / 3

@ 04,00 say "A media dos numeros " + str(nNumero1) + ", " + str(nNumero2) + " e " + str(nNumero3) + " eh: " + str(nMedia)
