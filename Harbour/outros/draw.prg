//compilar usando hbmk2 draw.prg -lhbct

while .t.
   clear

   nTempo := seconds()
   nPi := pi()/2
   Linha(40+cos(nTempo)*40,       12+sin(nTempo)*12,       40+cos(nTempo+nPi)*40,   12+sin(nTempo+nPi)*12  )
   Linha(40+cos(nTempo+nPi)*40,   12+sin(nTempo+nPi)*12,   40+cos(nTempo+nPi*2)*40, 12+sin(nTempo+nPi*2)*12)
   Linha(40+cos(nTempo+nPi*2)*40, 12+sin(nTempo+nPi*2)*12, 40+cos(nTempo+nPi*3)*40, 12+sin(nTempo+nPi*3)*12)
   Linha(40+cos(nTempo+nPi*3)*40, 12+sin(nTempo+nPi*3)*12, 40+cos(nTempo)*40,       12+sin(nTempo)*12      )
end

function Linha(nX1,nY1,nX2,nY2)
local nComprimento,nTamanhoX,nTamanhoY
   nTamanhoX := nX2 - nX1
   nTamanhoY := nY2 - nY1
   nComprimento := max(abs(nTamanhoX), abs(nTamanhoY))
   for nIterador := 0 to nComprimento-1
      @ nY1+(nIterador/nComprimento*nTamanhoY),nX1+(nIterador/nComprimento*nTamanhoX) say 'Û'
   next
return
