// parte visual
clear
set scoreboard off
@ 00,00 to 24,79 double
@ 00,02 say 'exe09'

cLetra   := ' '
dData    := CToD('')
nInteiro := 0
nDecimal := 0
cString  := Space(20)

@ 01,02 say 'Digite uma letra........:'
@ 02,02 say 'Digite uma data.........:'
@ 03,02 say 'Digite um numero inteiro:'
@ 04,02 say 'Digite um numero decimal:'
@ 05,02 say 'Digite uma string.......:'

@ 01,28 get cLetra   picture '@!'     valid !Empty(cLetra)
@ 02,28 get dData                     valid !Empty(dData)
@ 03,28 get nInteiro picture '999'
@ 04,28 get nDecimal picture '999.99'
@ 05,28 get cString  picture '@!'     valid !Empty(cString)
read

@ 07,02 say 'Letra.........: ' + cLetra
@ 08,02 say 'Data..........: ' + DToC(dData)
@ 09,02 say 'Numero inteiro: ' + AllTrim(Str(nInteiro))
@ 10,02 say 'Numero decimal: ' + AllTrim(Str(nDecimal))
@ 11,02 say 'String........: ' + cString

@ 23,02 say 'Pressione qualquer tecla para continuar...'
Inkey(0)