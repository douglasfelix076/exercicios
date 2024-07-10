clear

// se nRepetir e falso a te o fim da iteracao
// repete o algoritmo
nRepetir := .t.
nTamanho := 25 // tamanho da array

aNumeros := Array(nTamanho)// array com numeros restantes para aleatoriza‡Æo
aArray := Array(nTamanho) // array para organizar

for nI := 1 to nTamanho
   aNumeros[nI] := nI
   aArray[nI] := nI
next

for nI := 1 to nTamanho
   nAleatorio := 1 + Round(hb_Random() * (nTamanho - nI), 0)
   aArray[nI] := aNumeros[nAleatorio]
   ADel(aNumeros, nAleatorio)
next

Draw() // desenho inicial da lista
inkey(0)

while nRepetir
   clear
   nRepetir := .f.
   for nI := 1 to nTamanho
      if (nI < len(aArray))
         if (aArray[nI] > aArray[nI+1])
            nTemp := aArray[nI]
            aArray[nI]:= aArray[nI+1]
            aArray[nI+1]:= nTemp
            nRepetir := .t. // se qualquer numero for encontrado em uma posicao errada, nRepetir = true
         end
      end
   next

   Draw()
   inkey(0.05)
end

inkey(0)

function Draw()
local nI
   for nI := 1 to nTamanho
      @ nI,00 say replicate('Û', aArray[nI] * 2)
   next
return
