set wrap on

clear

nLargura   := 30
nAltura    := 15
nPosicoes  := nLargura * nAltura
cCampo     := Space(nPosicoes)
nContador  := 0
nAleatorio := 0
aPosicoes       := Array(nPosicoes)
aPosicoesUsadas := Array(nPosicoes)

do while nContador < nPosicoes
   aPosicoes[nContador]       := nContador
   aPosicoesUsadas[nContador] := nContador
   nContador++
enddo


do while nContador < nPosicoes
   nAleatorio := 1 + Round(hb_Random() * (nTamanho - nI), 0)
   aArray[nI] := aNumeros[nAleatorio]
   ADel(aPosicoesUsadas, nAleatorio)
next
/*
do while nContador++ < nAltura
   cCampo += Replicate(Str(nContador, 1), nLargura)
enddo
*/
//@ 00,00 say cCampo

do while .t.
   nEscolhaX := 1
   nEscolhaY := 1
   cAcao     := ' '

   @ 00,31 to 16,31
   @ 00,00 to 16,60
   @ 01,33 say 'Proxima acao:'
   @ 02,33 say '[A]brir'
   @ 03,33 say '[B]andeira'
   @ 04,33 say 'Abrir em [V]olta'

   nContador := 0
   do while nContador < nAltura
      @ 01+nContador,01 prompt SubStr(cCampo, (nContador * nLargura)+1, nLargura)
      nContador++
   enddo
   menu to nEscolhaX

   nContador := 0
   cLinha    := SubStr(cCampo, ((nEscolhaX-1) * nLargura)+1, nLargura)

   do while nContador < nLargura
      @ nEscolhaX,01+nContador prompt SubStr(cLinha, nContador, 1)
      nContador++
   enddo
   menu to nEscolhaY

   @ 01,47 get cAcao picture '@!' valid cAcao $ 'ABV'
   read
   //Inkey(0)
enddo
