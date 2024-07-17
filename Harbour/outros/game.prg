set scoreboard off
set color to 'N/W+'
clear

nNumero      := 0
nContador    := 0
nPosicaoY    := 0
nPosicaoX    := 0
nVelocidadeX := 1
nVelocidadeY := 0
nGravidade   := 0.06
nPulo        := 1

do while .t.
   clear typeahead
   @ nPosicaoY-2,nPosicaoX clear to nPosicaoY,nPosicaoX+4

   if (LastKey() == 27)
      nVelocidadeY := -nPulo
   endif

   nVelocidadeY += nGravidade

   nPosicaoX    += nVelocidadeX
   nPosicaoY    += nVelocidadeY

   if (nPosicaoY >= 23)
      nPosicaoY    := 23
      nVelocidadeY := 0
   endif

   if (nPosicaoX <= 0)
      nPosicaoX    := 0
      nVelocidadeX := 1
   elseif (nPosicaoX >= 75)
      nPosicaoX    := 75
      nVelocidadeX := -1
   endif

   @ nPosicaoY,nPosicaoX say 'лллл'
   @ nPosicaoY-1,nPosicaoX say 'лллл'
   @ nPosicaoY-2,nPosicaoX say 'лллл'

   @ 23,00 say Replicate('Ф', 80)
   inkey(0.01)
enddo

