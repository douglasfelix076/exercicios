clear

nNumero1 := 0
nNumero2 := 0

@ 00,00 say "Numero 1: "
@ 01,00 say "Numero 2: "
@ 00,10 get nNumero1
@ 01,10 get nNumero2
read

nProduto := nNumero1 * nNumero2

@ 03,00 say "o produto do numero " +  str(nNumero1) + " e " + str(nNumero2) + " eh: " + str(nProduto) + "."
