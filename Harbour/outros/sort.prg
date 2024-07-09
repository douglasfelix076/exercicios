// array para organizar (nao conheco nenhuma funcao para gerar numeros aleatorios)
aArray := { 10, 25, 24, 1, 2, 21, 8, 4, 12, 7, 11, 9, 16, 15, 18, 23, 22, 3, 17, 13, 5, 20, 19, 14, 6 }

// se nRepetir e falso a te o fim da iteracao
// repete o algoritmo
nRepetir := .t.

nTamanho := len(aArray)

clear
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
