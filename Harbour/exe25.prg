// parte visual
clear
set scoreboard off
@ 00,00 to 24,79
@ 00,02 say 'exe25'

nPessoasEntrevistadas  := 50
nHomensEntrevistados   := 0
nMulheresEntrevistadas := 0
nPercentualHomens      := 0
nPercentualMulheres    := 0
nPessoasGostaram       := 0
nPessoasNaoGostaram    := 0
nMulheresNaoGostaram   := 0

// gets
cSexo     := ' '
cGostou   := ' '
nContador := 0

do while nContador++ < nPessoasEntrevistadas

   cSexo   := ' '
   cGostou := ' '
   @ 01,02 clear to 02,60 // apaga a entrevista anterior
   @ 01,02 say 'Entrevistado n' + alltrim(str(nContador))
   @ 02,02 say 'Digite seu Sexo...(M-F):'
   @ 03,02 say 'Gostou do produto?(S-N):'

   @ 02,27 get cSexo   picture '@!' valid (cSexo == 'F' .or. cSexo == 'M')
   @ 03,27 get cGostou picture '@!' valid (cGostou == 'S' .or. cGostou == 'N')
   read

   if cSexo == 'F'
      nMulheresEntrevistadas++

      if cGostou == 'N'
         nMulheresNaoGostaram++
      endif
   else
      nHomensEntrevistados++
   endif

   // pessoas que gostaram
   if cGostou == 'S'
      nPessoasGostaram++
   else
      nPessoasNaoGostaram++
   endif

enddo

nPercentualHomens   := nHomensEntrevistados * 100 / nPessoasEntrevistadas
nPercentualMulheres := nMulheresEntrevistadas * 100 / nPessoasEntrevistadas

@ 01,02 clear to 02,60
@ 01,02 say 'Percentual de homens entrevistados.........: ' + alltrim(Transform(nPercentualHomens, '999.9')) + '%.'
@ 02,02 say 'Percentual de mulheres entrevistadas.......: ' + alltrim(Transform(nPercentualMulheres, '999.9')) + '%.'
@ 03,02 say 'Qtd pessoas que nao gostaram do produto....: ' + alltrim(str(nPessoasNaoGostaram)) + '.'
@ 04,02 say 'Qtd mulheres que nao gostaram do produto...: ' + alltrim(str(nMulheresNaoGostaram)) + '.'

@ 23,02 say 'Pressione qualquer tecla para continuar...'
inkey(0)
