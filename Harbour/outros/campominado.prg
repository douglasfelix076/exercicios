set scoreboard off
set color to 'N+/W'
clear

nTamanho := 23 // tamaho NxN
nMinas   := 100 // numero de minas
aCampo   := Array(nTamanho, nTamanho)

nNumero := 0
cX      := 0
cY      := 0

NovoCampo()
do while .t.
   DesenharCampo()
   nInput := Inkey(0)

   @ 02,26 say 'digita a letra da posicao:'
   @ 03,26 say 'X:'
   @ 04,26 say 'Y:'

   @ 03,28 get nX picture '@!'
   @ 04,28 get nY picture '@!'
   read

   nY := MCol()
   nX := MRow()//Round(MRow()/2 - 0.1, 0)
   Alert('X: ' + Str(nX) + 'Y: ' + Str(nY))
   aCampo[nX, nY, 1] := !aCampo[nX, nY, 1]
   DesenharCampo()
   Inkey(0)
enddo

procedure NovoCampo()
local nRestante, nRndX, nRndY
   for nContador2 := 1 TO nTamanho
      for nContador1 := 1 TO nTamanho
         aCampo[nContador2, nContador1] = { .f., .f., .f. }
      next
   next
   nRestante := nMinas
   do while nRestante > 0
      nRndX := Round(hb_Random() * (nTamanho-1), 0)+1
      nRndY := Round(hb_Random() * (nTamanho-1), 0)+1
      //Alert('Restantes: ' + AllTrim(Str(nRestante)) + ', X: ' + AllTrim(Str(nRndX)) + ', Y: ' + AllTrim(Str(nRndY)))
      //Alert('X: ' + Str(nRndX) + 'Y: ' + Str(nRndY))
      if (!aCampo[nRndY, nRndX, 3])
         aCampo[nRndY, nRndX, 3] := .t.
         nRestante--
      endif
   enddo
return

procedure DesenharCampo()
local cCaractere, cCor
   clear

   cCaractere := 'лл'
   cCor       := 'W'
   @ 00,00 to nTamanho+1,nTamanho*2+3 double

   for nContador2 := 1 TO nTamanho
      for nContador1 := 1 TO nTamanho
         aCelula := aCampo[nContador2, nContador1]

         if (aCelula[1]) // se estiver aberto
            if (aCelula[3]) // se estiver com mina
               cCor       := 'N/W'
               cCaractere := ' '
            else
               cCor       := 'W/W+'
               cCaractere := '  '
            endif
         else // se estiver fechado
            if (aCelula[2]) // se estiver com bandeira
               cCor       := 'R+/BG'
               cCaractere := '|'
            else
               cCor       := 'W/BG'
               cCaractere := '  '
            endif
         endif

         @ nY+nContador2,nX+nContador1*2 say cCaractere color cCor
      next

      cCaractere := nC
      @ nContador2,00 say cCaractere
      @ 00,nContador2*2 say cCaractere
   next
return

