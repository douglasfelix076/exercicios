// compilar usando hbmk2 sine.prg -lhbct

while .t.
   clear
   nFrequencia := 0.1
   nVelocidade := 4
   nAmplitude := 7
   nTempo := Seconds() *nVelocidade
   for nIndex := 0 to 79
      nY := (sin(nTempo + nIndex * nFrequencia) * nAmplitude) + 12.5 + (sin(nTempo + nIndex * nFrequencia * 0.5) * nAmplitude)

      cCaractere := 'Û'

      // checagem para adicionar uma pequena diferenca no caractere
      nDiferenca := ceiling(nY) - nY
      if (nDiferenca >= 2/3)
         cCaractere := 'ß'
      elseif (nDiferenca < 1/3)
         cCaractere := 'Ü'
      endif

      @ nY,nIndex say cCaractere
   next
end
