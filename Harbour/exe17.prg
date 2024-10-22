// parte visual
clear
set scoreboard off
@ 00,00 to 24,79 double
@ 00,02 say 'exe17'


cPalavra          := Space(40)
nTamanhoDaPalavra := 0
nContador         := 0

@ 01,02 say 'Digite um texto:'

@ 01,19 get cPalavra valid !Empty(cPalavra)
read

cPalavra          := AllTrim(cPalavra) // remover os caracteres vazios
nTamanhoDaPalavra := Len(cPalavra)

do while nContador < nTamanhoDaPalavra
	// digita letra por letra do fim ao inicio
	@ 03,02 + nContador say SubStr(cPalavra, nTamanhoDaPalavra - nContador, 1)
	nContador++
enddo

@ 23,02 say 'Pressione qualquer tecla para continuar...'
Inkey(0)