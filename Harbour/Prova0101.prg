// Douglas Felix dos Santos Moreira

set date to british
set epoch to 1940
set scoreboard off
set color to 'N/W+'
clear
@ 00,00 to 24,79 double

// informacoes do aluno
cNome         := Space(20)
cCurso        := Space(15)
nSerie        := 0
nAno          := 0
nMensalidade  := 0
dNascimento   := CToD('')
cBolsa        := Space(1)

nLinha           := 0 // posicionamento 'vertical' dos gets
nPosicao         := 0 // posicionamento 'horizontal' dos gets
nFaltaTotal      := 0
nNotaTotal       := 0
nNota1           := 0
nNota2           := 0
nNota3           := 0
nNota4           := 0
nFalta1          := 0
nFalta2          := 0
nFalta3          := 0
nFalta4          := 0
nDependencias    := 0
nMaxDependencias := 2
nConselhoA       := 0
nConselhoB       := 0
nConselhoC       := 0

cMateriaA           := Space(15)
cMateriaB           := Space(15)
cMateriaC           := Space(15)
cMateriaD           := Space(15)
cMateriasReprovadas := '' // contem o nome de todas as materias reprovadas
cMateriaStatus      := 'Aprovado'
cStatus             := 'Aprovado'
cMensalidade        := '' // mensagem mostrando mudancas na mensalidade

lMateriaAprovada := .t. // conselho aprovou a materia

// visual
cMascaraValor      := '@E 9,999.99' // valor da mensalidade
cMascaraTexto      := '@!'
cMascaraConselho   := '9'
cMascaraGeral      := '99' // mascara usada durante o get das faltas e notas
cMascaraFaltaTotal := '999'
cMascaraNotaTotal  := '99.9'
cCorNumeros        := 'RB/W'
cCorTexto          := 'N/W'
cCorAprovado       := 'G/W'
cCorReprovado      := 'R/W'
cCorDependencia    := 'RB/W'
cCorFalta          := cCorAprovado // cor se aprovado/reprovado no numero de faltas final
cCorNotas          := cCorAprovado // cor se aprovado/reprovado na nota final
cCorStatusMat      := cCorAprovado // cor se aprovado/reprovado na materia
cCorStatus         := cCorAprovado // cor se aprovado/reprovado no ano

@ 01,02 say 'Instituto Felix' color cCorTexto
//@ 02,02 say 'Digite as informacoes'
@ 03,02 say 'Nome........:'
@ 04,02 say 'D/Nascimento:'
@ 05,02 say 'Curso.......:'
@ 06,02 say 'Serie.......:'
@ 03,40 say 'Ano letivo. :'
@ 04,40 say 'Mensalidade :'
@ 05,40 say 'Bolsa(I/P/N):'

@ 03,16 get cNome        picture cMascaraTexto valid !(Empty(cNome) .or. '1' $ cNome .or. '2' $ cNome .or. '3' $ cNome .or. '4' $ cNome .or. '5' $ cNome .or. '6' $ cNome .or. '7' $ cNome .or. '8' $ cNome .or. '9' $ cNome .or. '0' $ cNome)
@ 04,16 get dNascimento                        valid dNascimento < Date()
@ 05,16 get cCurso       picture cMascaraTexto valid !(Empty(cCurso) .or. '1' $ cCurso .or. '2' $ cCurso .or. '3' $ cCurso .or. '4' $ cCurso .or. '5' $ cCurso .or. '6' $ cCurso .or. '7' $ cCurso .or. '8' $ cCurso .or. '9' $ cCurso .or. '0' $ cCurso)
@ 06,16 get nSerie       picture '9'           valid nSerie > 0
@ 03,54 get nAno         picture '9999'        valid nAno >= 2000 .and. nAno <= Year(Date())
@ 04,54 get nMensalidade picture cMascaraValor valid nMensalidade > 0
@ 05,54 get cBolsa       picture '@!'          valid cBolsa $ 'IPN'
read

Inkey(0)

// desenho da caixa
//@ 08,03 say cCurso    color cCorTexto
@ 08,03 say '      \Bimestre'                       color cCorTexto
@ 09,03 say 'Materia\       '                       color cCorTexto
@ 08,20 say 'BIM 1   BIM 2   BIM 3   BIM 4   Final' color cCorTexto
@ 09,20 say Replicate('N   F   ', 5)                color cCorTexto
@ 07,18 to 15,70 // linha horizontal
@ 07,26 to 15,34 // linha vertical
@ 07,34 to 15,42 // linha vertical
@ 07,50 to 15,70 // linha vertical
@ 10,02 to 15,70 // linha horizontal
@ 07,02 to 15,70 double
@ 10,18 say Replicate('ÁÄÄÄÄÄÄÄ', 5)

@ 11,03 get cMateriaA picture cMascaraTexto valid !Empty(cMateriaA) color cCorTexto
@ 12,03 get cMateriaB picture cMascaraTexto valid !Empty(cMateriaB) color cCorTexto
@ 13,03 get cMateriaC picture cMascaraTexto valid !Empty(cMateriaC) color cCorTexto
@ 14,03 get cMateriaD picture cMascaraTexto valid !Empty(cMateriaD) color cCorTexto
read

cMateriaA := AllTrim(cMateriaA)
cMateriaB := AllTrim(cMateriaB)
cMateriaC := AllTrim(cMateriaC)
cMateriaD := AllTrim(cMateriaD)

// MATERIA A
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nNota1  picture cMascaraGeral valid nNota1  >= 0 .and. nNota1  <= 10 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nFalta1 picture cMascaraGeral valid nFalta1 >= 0 .and. nFalta1 <= 60 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nNota2  picture cMascaraGeral valid nNota2  >= 0 .and. nNota2  <= 10 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nFalta2 picture cMascaraGeral valid nFalta2 >= 0 .and. nFalta2 <= 60 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nNota3  picture cMascaraGeral valid nNota3  >= 0 .and. nNota3  <= 10 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nFalta3 picture cMascaraGeral valid nFalta3 >= 0 .and. nFalta3 <= 60 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nNota4  picture cMascaraGeral valid nNota4  >= 0 .and. nNota4  <= 10 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nFalta4 picture cMascaraGeral valid nFalta4 >= 0 .and. nFalta4 <= 60 color cCorNumeros
read
nNotaTotal  := (nNota1 + nNota2 + nNota3 + nNota4) / 4
nFaltaTotal := nFalta1 + nFalta2 + nFalta3 + nFalta4

if (nNotaTotal < 6)
   cCorNotas := cCorReprovado
   lMateriaAprovada := .f.
endif

if (nFaltaTotal > 48)
   cCorFalta := cCorReprovado
   lMateriaAprovada := .f.

   if (nFaltaTotal > 48 .and. nFaltaTotal < 56) // conselho
      // desenho da caixa do conselho
      @ 16,02 to 21,17 double
      @ 17,03 say 'Conselho (1/0)'
      @ 18,03 say 'Professor A:'
      @ 19,03 say 'Professor B:'
      @ 20,03 say 'Professor C:'

      @ 18,16 get nConselhoA picture cMascaraConselho valid nConselhoA = 1 .or. nConselhoA = 0
      @ 19,16 get nConselhoB picture cMascaraConselho valid nConselhoB = 1 .or. nConselhoB = 0
      @ 20,16 get nConselhoC picture cMascaraConselho valid nConselhoC = 1 .or. nConselhoC = 0
      read
      if (nConselhoA + nConselhoB + nConselhoC >= 2)
         lMateriaAprovada := .t.
         cMateriaStatus  += ' C'
      endif
   endif

   @ 16,02 clear to 21,17
endif

if (!lMateriaAprovada)
   nDependencias++
   cCorStatusMat       := cCorReprovado
   cMateriaStatus      := 'Reprovado'
   cMateriasReprovadas += cMateriaA + ' '
endif

@ 11 + nLinha, 19 + (nPosicao++ * 4) say nNotaTotal     picture cMascaraNotaTotal  color cCorNotas
@ 11 + nLinha, 19 + (nPosicao++ * 4) say nFaltaTotal    picture cMascaraFaltaTotal color cCorFalta
@ 11 + nLinha, 19 + (nPosicao++ * 4) say cMateriaStatus                            color cCorStatusMat

// reiniciando as variaveis para reuso
nLinha++
nPosicao         := 0
nNota1           := 0
nNota2           := 0
nNota3           := 0
nNota4           := 0
nFalta1          := 0
nFalta2          := 0
nFalta3          := 0
nFalta4          := 0
nConselhoA       := 0
nConselhoB       := 0
nConselhoC       := 0
cCorFalta        := cCorAprovado
cCorNotas        := cCorAprovado
cCorStatusMat    := cCorAprovado
cMateriaStatus   := 'Aprovado'
lMateriaAprovada  := .t.

// MATERIA B
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nNota1  picture cMascaraGeral valid nNota1  >= 0 .and. nNota1  <= 10 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nFalta1 picture cMascaraGeral valid nFalta1 >= 0 .and. nFalta1 <= 60 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nNota2  picture cMascaraGeral valid nNota2  >= 0 .and. nNota2  <= 10 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nFalta2 picture cMascaraGeral valid nFalta2 >= 0 .and. nFalta2 <= 60 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nNota3  picture cMascaraGeral valid nNota3  >= 0 .and. nNota3  <= 10 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nFalta3 picture cMascaraGeral valid nFalta3 >= 0 .and. nFalta3 <= 60 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nNota4  picture cMascaraGeral valid nNota4  >= 0 .and. nNota4  <= 10 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nFalta4 picture cMascaraGeral valid nFalta4 >= 0 .and. nFalta4 <= 60 color cCorNumeros
read
nNotaTotal  := (nNota1 + nNota2 + nNota3 + nNota4) / 4
nFaltaTotal := nFalta1 + nFalta2 + nFalta3 + nFalta4

if (nNotaTotal < 6)
   cCorNotas := cCorReprovado
   lMateriaAprovada := .f.
endif

if (nFaltaTotal > 48)
   cCorFalta := cCorReprovado
   lMateriaAprovada := .f.

   if (nNotaTotal >= 6 .and. nFaltaTotal < 56) // conselho
      // desenho da caixa do conselho
      @ 16,02 to 21,17 double
      @ 17,03 say 'Conselho (1/0)'
      @ 18,03 say 'Professor A:'
      @ 19,03 say 'Professor B:'
      @ 20,03 say 'Professor C:'

      @ 18,16 get nConselhoA picture cMascaraConselho valid nConselhoA = 1 .or. nConselhoA = 0
      @ 19,16 get nConselhoB picture cMascaraConselho valid nConselhoB = 1 .or. nConselhoB = 0
      @ 20,16 get nConselhoC picture cMascaraConselho valid nConselhoC = 1 .or. nConselhoC = 0
      read
      if (nConselhoA + nConselhoB + nConselhoC >= 2)
         lMateriaAprovada := .t.
         cMateriaStatus  += ' C'
      endif
   endif

   @ 16,02 clear to 21,17
endif

if (!lMateriaAprovada)
   nDependencias++
   cCorStatusMat       := cCorReprovado
   cMateriaStatus      := 'Reprovado'
   cMateriasReprovadas += cMateriaB + ' '
endif

@ 11 + nLinha, 19 + (nPosicao++ * 4) say nNotaTotal     picture cMascaraNotaTotal  color cCorNotas
@ 11 + nLinha, 19 + (nPosicao++ * 4) say nFaltaTotal    picture cMascaraFaltaTotal color cCorFalta
@ 11 + nLinha, 19 + (nPosicao++ * 4) say cMateriaStatus                            color cCorStatusMat

// reiniciando as variaveis para reuso
nLinha++
nPosicao         := 0
nNota1           := 0
nNota2           := 0
nNota3           := 0
nNota4           := 0
nFalta1          := 0
nFalta2          := 0
nFalta3          := 0
nFalta4          := 0
nConselhoA       := 0
nConselhoB       := 0
nConselhoC       := 0
cCorFalta        := cCorAprovado
cCorNotas        := cCorAprovado
cCorStatusMat    := cCorAprovado
cMateriaStatus   := 'Aprovado'
lMateriaAprovada  := .t.

// MATERIA C
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nNota1  picture cMascaraGeral valid nNota1  >= 0 .and. nNota1  <= 10 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nFalta1 picture cMascaraGeral valid nFalta1 >= 0 .and. nFalta1 <= 60 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nNota2  picture cMascaraGeral valid nNota2  >= 0 .and. nNota2  <= 10 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nFalta2 picture cMascaraGeral valid nFalta2 >= 0 .and. nFalta2 <= 60 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nNota3  picture cMascaraGeral valid nNota3  >= 0 .and. nNota3  <= 10 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nFalta3 picture cMascaraGeral valid nFalta3 >= 0 .and. nFalta3 <= 60 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nNota4  picture cMascaraGeral valid nNota4  >= 0 .and. nNota4  <= 10 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nFalta4 picture cMascaraGeral valid nFalta4 >= 0 .and. nFalta4 <= 60 color cCorNumeros
read
nFaltaTotal := nFalta1 + nFalta2 + nFalta3 + nFalta4
nNotaTotal  := (nNota1 + nNota2 + nNota3 + nNota4) / 4

if (nNotaTotal < 6)
   cCorNotas := cCorReprovado
   lMateriaAprovada := .f.
endif

if (nFaltaTotal > 48)
   cCorFalta := cCorReprovado
   lMateriaAprovada := .f.

   if (nFaltaTotal > 48 .and. nFaltaTotal < 56) // conselho
      // desenho da caixa do conselho
      @ 16,02 to 21,17 double
      @ 17,03 say 'Conselho (1/0)'
      @ 18,03 say 'Professor A:'
      @ 19,03 say 'Professor B:'
      @ 20,03 say 'Professor C:'

      @ 18,16 get nConselhoA picture cMascaraConselho valid nConselhoA = 1 .or. nConselhoA = 0
      @ 19,16 get nConselhoB picture cMascaraConselho valid nConselhoB = 1 .or. nConselhoB = 0
      @ 20,16 get nConselhoC picture cMascaraConselho valid nConselhoC = 1 .or. nConselhoC = 0
      read
      if (nConselhoA + nConselhoB + nConselhoC >= 2)
         lMateriaAprovada := .t.
         cMateriaStatus  += ' C'
      endif
   endif

   @ 16,02 clear to 21,17
endif

if (!lMateriaAprovada)
   nDependencias++
   cCorStatusMat       := cCorReprovado
   cMateriaStatus      := 'Reprovado'
   cMateriasReprovadas += cMateriaC + ' '
endif

@ 11 + nLinha, 19 + (nPosicao++ * 4) say nNotaTotal     picture cMascaraNotaTotal  color cCorNotas
@ 11 + nLinha, 19 + (nPosicao++ * 4) say nFaltaTotal    picture cMascaraFaltaTotal color cCorFalta
@ 11 + nLinha, 19 + (nPosicao++ * 4) say cMateriaStatus                            color cCorStatusMat

// reiniciando as variaveis para reuso
nLinha++
nPosicao         := 0
nNota1           := 0
nNota2           := 0
nNota3           := 0
nNota4           := 0
nFalta1          := 0
nFalta2          := 0
nFalta3          := 0
nFalta4          := 0
nConselhoA       := 0
nConselhoB       := 0
nConselhoC       := 0
cCorFalta        := cCorAprovado
cCorNotas        := cCorAprovado
cCorStatusMat    := cCorAprovado
cMateriaStatus   := 'Aprovado'
lMateriaAprovada  := .t.

// MATERIA D
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nNota1  picture cMascaraGeral valid nNota1  >= 0 .and. nNota1  <= 10 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nFalta1 picture cMascaraGeral valid nFalta1 >= 0 .and. nFalta1 <= 60 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nNota2  picture cMascaraGeral valid nNota2  >= 0 .and. nNota2  <= 10 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nFalta2 picture cMascaraGeral valid nFalta2 >= 0 .and. nFalta2 <= 60 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nNota3  picture cMascaraGeral valid nNota3  >= 0 .and. nNota3  <= 10 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nFalta3 picture cMascaraGeral valid nFalta3 >= 0 .and. nFalta3 <= 60 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nNota4  picture cMascaraGeral valid nNota4  >= 0 .and. nNota4  <= 10 color cCorNumeros
@ 11 + nLinha, 19 + (nPosicao++ * 4) get nFalta4 picture cMascaraGeral valid nFalta4 >= 0 .and. nFalta4 <= 60 color cCorNumeros
read
nFaltaTotal := nFalta1 + nFalta2 + nFalta3 + nFalta4
nNotaTotal  := (nNota1 + nNota2 + nNota3 + nNota4) / 4

if (nNotaTotal < 6)
   cCorNotas := cCorReprovado
   lMateriaAprovada := .f.
endif

if (nFaltaTotal > 48)
   cCorFalta := cCorReprovado
   lMateriaAprovada := .f.

   if (nFaltaTotal > 48 .and. nFaltaTotal < 56) // conselho
      // desenho da caixa do conselho
      @ 16,02 to 21,17 double
      @ 17,03 say 'Conselho (1/0)'
      @ 18,03 say 'Professor A:'
      @ 19,03 say 'Professor B:'
      @ 20,03 say 'Professor C:'

      @ 18,16 get nConselhoA picture cMascaraConselho valid nConselhoA = 1 .or. nConselhoA = 0
      @ 19,16 get nConselhoB picture cMascaraConselho valid nConselhoB = 1 .or. nConselhoB = 0
      @ 20,16 get nConselhoC picture cMascaraConselho valid nConselhoC = 1 .or. nConselhoC = 0
      read
      if (nConselhoA + nConselhoB + nConselhoC >= 2)
         lMateriaAprovada := .t.
         cMateriaStatus  += ' C'
      endif
   endif

   @ 16,02 clear to 21,17
endif

if (!lMateriaAprovada)
   nDependencias++
   cCorStatusMat       := cCorReprovado
   cMateriaStatus      := 'Reprovado'
   cMateriasReprovadas += cMateriaD + ' '
endif

@ 11 + nLinha, 19 + (nPosicao++ * 4) say nNotaTotal     picture cMascaraNotaTotal  color cCorNotas
@ 11 + nLinha, 19 + (nPosicao++ * 4) say nFaltaTotal    picture cMascaraFaltaTotal color cCorFalta
@ 11 + nLinha, 19 + (nPosicao++ * 4) say cMateriaStatus                            color cCorStatusMat

// RESULTADO FINAL
if (cBolsa = 'I')
   nMaxDependencias := 0
   nMensalidade *= 0.02 // 1-0.98
   cMensalidade += 'Desconto de bolsa (98%). '
elseif (cBolsa = 'P')
   nMaxDependencias := 1
   nMensalidade *= 0.5
   cMensalidade += 'Desconto de bolsa (50%). '
endif

if (nDependencias > nMaxDependencias)
   cStatus    := 'Reprovado'
   cCorStatus := cCorReprovado
elseif (nDependencias > 0)
   cStatus      += ', Com dependencia'
   cCorStatus   := cCorDependencia
   nMensalidade += nMensalidade * 0.15 * nDependencias
   cMensalidade += 'Acrescimo de +' + AllTrim(Str(nDependencias * 15)) + '% a mensalidade. '
endif

@ 16,03 say 'Aluno : '
@ 17,03 say 'Status: '
@ 16,11 say cNome   color cCorTexto
@ 17,11 say cStatus color cCorStatus

@ 18,03 say 'Materias que nao atingiram o minimo: '
@ 18,40 say cMateriasReprovadas                                   color cCorDependencia
@ 19,03 say cMensalidade
@ 20,03 say 'Mensalidade final: '
@ 20,22 say AllTrim(Transform(nMensalidade, cMascaraValor)) + '$' color cCorTexto

Inkey(0)
