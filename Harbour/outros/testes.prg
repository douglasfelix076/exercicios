set message to 22 center
set wrap on
clear

nAmp := 0.02
nFreq := 4
nPow := 0.8

nContador2 := 0
do while .t.
   nContador := 0
   nContador2 += 10
   do while nContador < nContador2+1000
      
      cCol := Str((nContador / 10000) + nContador2/100000)
      setcolor(cCol+'/'+cCol)
      
      nPosicao := (nContador^nPow)*nFreq
      nLinha   := Cos(nContador2+nPosicao) * nContador * nAmp
      nColuna  := Sin(nContador2+nPosicao) * nContador * nAmp*2
      
      @ 28 + nLinha, 100 + nColuna say 'X'
      //@ 28+nLinha,Sin(nContador)-nColuna say 'X'
      
      nContador++
   enddo

   Inkey(0.01)
   setcolor('0/0')
   //clear
enddo
/*
@ 00,00 to 24,79
@ 01,10 to 20,10
@ 22,01 to 22,78

Inkey(0)
*/