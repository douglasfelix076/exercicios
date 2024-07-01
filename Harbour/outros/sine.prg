// compilar usando hbmk2 sine.prg -lhbct

while .t.
   clear
   nTempo := Seconds()
   for nIndex := 0 to 79
      nY := (sin(nTempo + nIndex/6) * 12.5) + 12.5

      cCaractere := '�'

      // checagem para adicionar uma pequena diferenca no caractere
      nDiferenca := ceiling(nY) - nY
      if (nDiferenca >= 2/3)
         cCaractere := '�'
      elseif (nDiferenca < 1/3)
         cCaractere := '�'
      endif

      @ nY,nIndex say cCaractere
   next
end
