// compilar usando hbmk2 sine.prg -lhbct

while .t.
   clear
   nVelocidade1 := 2
   nFrequencia1 := 0.05
   nAmplitude1  := 8

   nVelocidade2 := -7.5
   nFrequencia2 := 0.2
   nAmplitude2  := 2
   nTempo := Seconds()
   for nIndex := 0 to 80
      nY := 12.5 + (sin(nTempo * nVelocidade1 + nIndex * nFrequencia1) * nAmplitude1) + (sin(nTempo * nVelocidade2 + nIndex * nFrequencia2) * nAmplitude2)

      cCaractere := 'Û'

      // checagem para adicionar uma pequena diferenca no caractere
      nDiferenca := ceiling(nY) - nY
      if (nDiferenca >= 2/3)
         cCaractere := 'ß'
      elseif (nDiferenca < 1/3)
         cCaractere := 'Ü'
      endif

      setcolor(str(int(nTempo * 2)) + '/' + str(int(-nTempo * 2.5)))
      @ nY,nIndex say cCaractere
   next
end
