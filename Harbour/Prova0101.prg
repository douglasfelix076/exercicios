// Douglas Felix dos Santos Moreira

set date to british // muda o formato da data
set epoch to 1940 // muda o ano da data
set scoreboard off
set color to 'N/W+'
clear
@ 00,00 to 24,79 double

cNome        := Space(25)
cCurso       := Space(15)
nSerie       := 0
nAno         := 0
nMensalidade := 0
dNascimento  := CToD('')

nFaltaTotal    := 0
nNotaTotal     := 0
nNota1         := 0
nNota2         := 0
nNota3         := 0
nNota4         := 0
nFalta1        := 0
nFalta2        := 0
nFalta3        := 0
nFalta4        := 0
nDependencias  := 0

cMateriaStatus := 'Aprovado'
cMateriasReprovadas := '' // contem o nome de todas as materias reprovadas
cMateriaA := 'Matematica'
cMateriaB := 'Logica'
cMateriaC := 'Calculo'
cMateriaD := 'Analise'

cMascaraGeral     := '99' // mascara usada durante o get das faltas e notas
cMascaraFalta     := '999'
cMascaraValor     := '@E 9,999.99' // valor da mensalidade
cMascaraTexto     := '@!'
cMascaraNotaTotal := '99.9'

cCorNumeros     := 'RB/W'
cCorTexto       := 'N/W'
cCorAprovado    := 'G/W'
cCorReprovado   := 'R/W'
cCorDependencia := 'BG/W'
cCorFalta     := cCorAprovado // cor do numero de faltas aprovado\reprovado
cCorNotas     := cCorAprovado // cor da nota final aprovado\reprovado
cCorStatusMat := cCorAprovado // cor se se reprovado ou nao na materia
cCorStatus    := cCorAprovado // cor se reprovado ou nao

lAprovado        := .t.
lDependencia     := .f. // levou dependencia
lMateriaAprovada := .t. // reprovado em uma materia

@ 01,02 say 'Instituto Felix'
@ 03,02 say 'Digite as informacoes'
@ 04,02 say 'Nome..............:'
@ 05,02 say 'Data de nascimento:'
@ 06,02 say 'Curso.............:'
@ 07,02 say 'Serie.............:'
@ 08,02 say 'Ano letivo........:'
@ 09,02 say 'Mensalidade.......:'

@ 04,22 get cNome        picture cMascaraTexto valid !Empty(cNome)
@ 05,22 get dNascimento                        valid dNascimento < Date()
@ 06,22 get cCurso       picture cMascaraTexto valid !Empty(cCurso)
@ 07,22 get nSerie       picture '9'           valid nSerie > 0
@ 08,22 get nAno         picture '99'          valid nAno >= 00 .and. nAno <= Year(Date())
@ 09,22 get nMensalidade picture cMascaraValor valid nMensalidade >= 0
read

Inkey(0)

// desenho da caixa
@ 12,03 say cCurso color 'N/W+'
@ 12,20 say 'B1      B2      B3      B4       Final'
@ 13,20 say Replicate('N   F   ', 5)
@ 11,18 to 19,70
@ 11,27 to 19,35
@ 14,02 to 19,70
@ 11,50 to 19,70
@ 11,02 to 19,70 double
@ 15,04 say cMateriaA
@ 17,04 say cMateriaB
@ 16,04 say cMateriaC
@ 18,04 say cMateriaD

nLinha  := 0
nColuna := 0

// MATERIA 1
@ 15 + nColuna, 20 + (nLinha++ * 4) get nNota1  picture cMascaraGeral valid nNota1  >= 0 .and. nNota1  <= 10 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nFalta1 picture cMascaraGeral valid nFalta1 >= 0 .and. nFalta1 <= 60 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nNota2  picture cMascaraGeral valid nNota2  >= 0 .and. nNota2  <= 10 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nFalta2 picture cMascaraGeral valid nFalta2 >= 0 .and. nFalta2 <= 60 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nNota3  picture cMascaraGeral valid nNota3  >= 0 .and. nNota3  <= 10 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nFalta3 picture cMascaraGeral valid nFalta3 >= 0 .and. nFalta3 <= 60 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nNota4  picture cMascaraGeral valid nNota4  >= 0 .and. nNota4  <= 10 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nFalta4 picture cMascaraGeral valid nFalta4 >= 0 .and. nFalta4 <= 60 color cCorNumeros
read
nNotaTotal  := (nNota1 + nNota2 + nNota3 + nNota4) / 4
nFaltaTotal := nFalta1 + nFalta2 + nFalta3 + nFalta4

if (nNotaTotal < 6)
   lMateriaAprovada := .f.
   cCorNotas := cCorReprovado
endif
if (nFaltaTotal > 48)
   lMateriaAprovada := .f.
   cCorFalta := cCorReprovado
endif

if (!lMateriaAprovada)
   nDependencias++
   cCorStatusMat       := cCorReprovado
   cMateriasReprovadas += cMateriaA + ' '
   cMateriaStatus      := 'Reprovado'
endif

@ 15 + nColuna, 19 + (nLinha++ * 4) say nNotaTotal     picture cMascaraNotaTotal color cCorNotas
@ 15 + nColuna, 19 + (nLinha++ * 4) say nFaltaTotal    picture cMascaraFalta     color cCorFalta
@ 15 + nColuna, 19 + (nLinha++ * 4) say cMateriaStatus                           color cCorStatusMat

// reiniciando as variaveis para reuso
nColuna++
nLinha           := 0
nNota1           := 0
nNota2           := 0
nNota3           := 0
nNota4           := 0
nFalta1          := 0
nFalta2          := 0
nFalta3          := 0
nFalta4          := 0
cCorFalta        := cCorAprovado
cCorNotas        := cCorAprovado
cCorStatusMat    := cCorAprovado
lMateriaAprovada := .t.
cMateriaStatus   := 'Aprovado'

// MATERIA 2
@ 15 + nColuna, 20 + (nLinha++ * 4) get nNota1  picture cMascaraGeral valid nNota1  >= 0 .and. nNota1  <= 10 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nFalta1 picture cMascaraGeral valid nFalta1 >= 0 .and. nFalta1 <= 60 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nNota2  picture cMascaraGeral valid nNota2  >= 0 .and. nNota2  <= 10 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nFalta2 picture cMascaraGeral valid nFalta2 >= 0 .and. nFalta2 <= 60 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nNota3  picture cMascaraGeral valid nNota3  >= 0 .and. nNota3  <= 10 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nFalta3 picture cMascaraGeral valid nFalta3 >= 0 .and. nFalta3 <= 60 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nNota4  picture cMascaraGeral valid nNota4  >= 0 .and. nNota4  <= 10 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nFalta4 picture cMascaraGeral valid nFalta4 >= 0 .and. nFalta4 <= 60 color cCorNumeros
read
nNotaTotal  := (nNota1 + nNota2 + nNota3 + nNota4) / 4
nFaltaTotal := nFalta1 + nFalta2 + nFalta3 + nFalta4

if (nNotaTotal < 6)
   lMateriaAprovada := .f.
   cCorNotas := cCorReprovado
endif
if (nFaltaTotal > 48)
   lMateriaAprovada := .f.
   cCorFalta := cCorReprovado
endif

if (!lMateriaAprovada)
   nDependencias++
   cCorStatusMat       := cCorReprovado
   cMateriasReprovadas += cMateriaB + ' '
   cMateriaStatus      := 'Reprovado'

endif

@ 15 + nColuna, 19 + (nLinha++ * 4) say nNotaTotal     picture cMascaraNotaTotal color cCorNotas
@ 15 + nColuna, 19 + (nLinha++ * 4) say nFaltaTotal    picture cMascaraFalta     color cCorFalta
@ 15 + nColuna, 19 + (nLinha++ * 4) say cMateriaStatus                           color cCorStatusMat

// reiniciando as variaveis para reuso
nColuna++
nLinha           := 0
nNota1           := 0
nNota2           := 0
nNota3           := 0
nNota4           := 0
nFalta1          := 0
nFalta2          := 0
nFalta3          := 0
nFalta4          := 0
cCorFalta        := cCorAprovado
cCorNotas        := cCorAprovado
cCorStatusMat    := cCorAprovado
lMateriaAprovada := .t.
cMateriaStatus   := 'Aprovado'

// MATERIA 3
@ 15 + nColuna, 20 + (nLinha++ * 4) get nNota1  picture cMascaraGeral valid nNota1  >= 0 .and. nNota1  <= 10 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nFalta1 picture cMascaraGeral valid nFalta1 >= 0 .and. nFalta1 <= 60 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nNota2  picture cMascaraGeral valid nNota2  >= 0 .and. nNota2  <= 10 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nFalta2 picture cMascaraGeral valid nFalta2 >= 0 .and. nFalta2 <= 60 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nNota3  picture cMascaraGeral valid nNota3  >= 0 .and. nNota3  <= 10 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nFalta3 picture cMascaraGeral valid nFalta3 >= 0 .and. nFalta3 <= 60 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nNota4  picture cMascaraGeral valid nNota4  >= 0 .and. nNota4  <= 10 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nFalta4 picture cMascaraGeral valid nFalta4 >= 0 .and. nFalta4 <= 60 color cCorNumeros
read
nFaltaTotal := nFalta1 + nFalta2 + nFalta3 + nFalta4
nNotaTotal  := (nNota1 + nNota2 + nNota3 + nNota4) / 4

if (nNotaTotal < 6)
   lMateriaAprovada := .f.
   cCorNotas := cCorReprovado
endif
if (nFaltaTotal > 48)
   lMateriaAprovada := .f.
   cCorFalta := cCorReprovado
endif

if (!lMateriaAprovada)
   nDependencias++
   cCorStatusMat       := cCorReprovado
   cMateriasReprovadas += cMateriaC + ' '
   cMateriaStatus      := 'Reprovado'

endif

@ 15 + nColuna, 19 + (nLinha++ * 4) say nNotaTotal     picture cMascaraNotaTotal color cCorNotas
@ 15 + nColuna, 19 + (nLinha++ * 4) say nFaltaTotal    picture cMascaraFalta     color cCorFalta
@ 15 + nColuna, 19 + (nLinha++ * 4) say cMateriaStatus                           color cCorStatusMat

// reiniciando as variaveis para reuso
nColuna++
nLinha           := 0
nNota1           := 0
nNota2           := 0
nNota3           := 0
nNota4           := 0
nFalta1          := 0
nFalta2          := 0
nFalta3          := 0
nFalta4          := 0
cCorFalta        := cCorAprovado
cCorNotas        := cCorAprovado
cCorStatusMat    := cCorAprovado
lMateriaAprovada := .t.
cMateriaStatus   := 'Aprovado'

// MATERIA 4
@ 15 + nColuna, 20 + (nLinha++ * 4) get nNota1  picture cMascaraGeral valid nNota1  >= 0 .and. nNota1  <= 10 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nFalta1 picture cMascaraGeral valid nFalta1 >= 0 .and. nFalta1 <= 60 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nNota2  picture cMascaraGeral valid nNota2  >= 0 .and. nNota2  <= 10 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nFalta2 picture cMascaraGeral valid nFalta2 >= 0 .and. nFalta2 <= 60 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nNota3  picture cMascaraGeral valid nNota3  >= 0 .and. nNota3  <= 10 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nFalta3 picture cMascaraGeral valid nFalta3 >= 0 .and. nFalta3 <= 60 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nNota4  picture cMascaraGeral valid nNota4  >= 0 .and. nNota4  <= 10 color cCorNumeros
@ 15 + nColuna, 20 + (nLinha++ * 4) get nFalta4 picture cMascaraGeral valid nFalta4 >= 0 .and. nFalta4 <= 60 color cCorNumeros
read
nFaltaTotal := nFalta1 + nFalta2 + nFalta3 + nFalta4
nNotaTotal  := (nNota1 + nNota2 + nNota3 + nNota4) / 4

if (nNotaTotal < 6)
   lMateriaAprovada := .f.
   cCorNotas := cCorReprovado
endif
if (nFaltaTotal > 48)
   lMateriaAprovada := .f.
   cCorFalta := cCorReprovado
endif

if (!lMateriaAprovada)
   nDependencias++
   cMateriasReprovadas += cMateriaD + ' '
   cCorStatusMat := cCorReprovado
endif

@ 15 + nColuna, 19 + (nLinha++ * 4) say nNotaTotal     picture cMascaraNotaTotal color cCorNotas
@ 15 + nColuna, 19 + (nLinha++ * 4) say nFaltaTotal    picture cMascaraFalta     color cCorFalta
@ 15 + nColuna, 19 + (nLinha++ * 4) say cMateriaStatus                           color cCorStatusMat

nColuna++

cStatus   := 'Aprovado'

if (nDependencias >= 3)
   cStatus := 'Reprovado'
   cCorStatus := cCorReprovado
elseif (nDependencias != 0)
   lDependencia := .t.
   cCorStatus := cCorDependencia
   cStatus += ', Com dependencia'
endif

@ 20,03 say 'Aluno: ' + cNome
@ 21,03 say 'Status: '
@ 21,11 say cStatus color cCorStatus

if (lDependencia)
   nMensalidade += nMensalidade * 0.15 * nDependencias
   @ 22,03 say 'Materias que nao atingiram o minimo: '
   @ 22,40 say cMateriasReprovadas color cCorDependencia
   @ 23,03 say 'Acrescimo de +' + AllTrim(Str(nDependencias * 15)) + '% a mensalidade. Nova mensalidade: ' + AllTrim(Transform(nMensalidade, cMascaraValor)) + '.'
endif

Inkey(0)
