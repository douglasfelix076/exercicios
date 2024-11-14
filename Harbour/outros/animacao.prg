clear

cQuadros       := '  -    /    |    \    -     /     |   \   -   /   |     \   '
nTamanho       := Len(cQuadros)
nTamanhoQuadro := 5
nPosicao       := 0

do while .t.
    @ 01,01 say SubStr(cQuadros, ((nPosicao * nTamanhoQuadro) % nTamanho) + 1, nTamanhoQuadro)
    nPosicao++
    Inkey(0.1)
enddo


