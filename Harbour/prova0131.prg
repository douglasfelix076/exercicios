// Douglas Felix dos Santos Moreira

set scoreboard off
set date to british
clear

// informações do aluno
cNome        := Space(15)
dNascimento  := CToD('')
cCurso       := Space(15)
nSerie       := 0
nMensalidade := 0

// get das notas e faltas
cMateriaA := Space(15)
cMateriaB := Space(15)
cMateriaC := Space(15)
nNota1    := 0
nNota2    := 0
nNota3    := 0
nNota4    := 0
nFalta1   := 0
nFalta2   := 0
nFalta3   := 0
nFalta4   := 0

// valores
nLinha    			  := 0
nColuna   			  := 0
nSerieMediaMinima     := 60 // media minima da serie
nSerieFaltaMaxima     := 6 // faltas maximas da serie
nNotaFinal            := 0
nFaltaFinal           := 0
nFaltasTotais         := 0
nMateriasReprovadas   := 0
cStatusMateria        := 'Aprovado' // aprovado/reprovado
cStatusAno            := 'Aprovado' // aprovado/reprovado
cMateriasReprovadas   := '' // contém o nome de todas as materias reprovadas
cMensalidadeAdicional := '' // mensagem mostrando o adicional da mensalidade (se tiver)

// cores
cCorReprova       := 'R/N'
cCorAprova        := 'G+/N'
cCorDependencia   := 'GR/N'
cCorFaltaFinal    := cCorAprova
cCorNotaFinal     := cCorAprova
cCorStatusMateria := cCorAprova
cCorStatusAno     := cCorAprova
cCorFaltasNoAno   := cCorAprova

@ 00,00 to 24,79 double
@ 01,02 say 'Colegio Garten Mendes'
@ 01,55 say 'Contato: N 44 1234-5678'

// input das informações
@ 03,02 say 'Nome........:'
@ 04,02 say 'D/Nascimento:'
@ 05,02 say 'Curso.......:'
@ 03,40 say 'Serie.......:'
@ 04,40 say 'Mensalidade.:'

@ 03,16 get cNome        picture '@!'        valid !Empty(cNome)
@ 04,16 get dNascimento                      valid !Empty(dNascimento) .and. dNascimento < Date()
@ 05,16 get cCurso       picture '@!'        valid !Empty(cCurso)
@ 03,54 get nSerie       picture '9'         valid nSerie >= 1 .and. nSerie <= 8
@ 04,54 get nMensalidade picture '@E 999.99' valid nMensalidade >= 0
read

cNome  := AllTrim(cNome)
cCurso := AllTrim(cCurso)

if nSerie >= 5 // 5-8 serie
	nSerieMediaMinima := 70
endif
if nSerie >= 4 // 4-8 serie
	nSerieFaltaMaxima := 8
endif

// desenho do boletim
@ 08,03 say '                  Bim 1   Bim 2   Bim 3   Bim 4   Final'
@ 09,03 say 'Materias          N   F   N   F   N   F   N   F   N   F'
@ 08,03 say cCurso
@ 07,27 to 16,35
@ 07,35 to 16,43
@ 10,01 to 10,70
@ 07,19 to 16,19
@ 07,51 to 16,51
@ 07,01 to 16,70 double

// nome das materias
@ 11,03 get cMateriaA valid !Empty(cMateriaA)
@ 13,03 get cMateriaB valid !Empty(cMateriaB)
@ 15,03 get cMateriaC valid !Empty(cMateriaC)
read

cMateriaA := AllTrim(cMateriaA)
cMateriaB := AllTrim(cMateriaB)
cMateriaC := AllTrim(cMateriaC)

// Input das notas e faltas
nLinha  := 11
nColuna := 0

// MATERIA A
@ nLinha, 20 + (nColuna++ * 4) get nNota1  picture '999' valid nNota1 >= 0 .and. nNota1 <= 100
@ nLinha, 20 + (nColuna++ * 4) get nFalta1 picture '999' valid nFalta1 >= 0
@ nLinha, 20 + (nColuna++ * 4) get nNota2  picture '999' valid nNota2 >= 0 .and. nNota2 <= 100
@ nLinha, 20 + (nColuna++ * 4) get nFalta2 picture '999' valid nFalta2 >= 0
@ nLinha, 20 + (nColuna++ * 4) get nNota3  picture '999' valid nNota3 >= 0 .and. nNota3 <= 100
@ nLinha, 20 + (nColuna++ * 4) get nFalta3 picture '999' valid nFalta3 >= 0
@ nLinha, 20 + (nColuna++ * 4) get nNota4  picture '999' valid nNota4 >= 0 .and. nNota4 <= 100
@ nLinha, 20 + (nColuna++ * 4) get nFalta4 picture '999' valid nFalta4 >= 0
read

nNotaFinal    := (nNota1 + nNota2 + nNota3 + nNota4) / 4
nFaltaFinal   := nFalta1 + nFalta2 + nFalta3 + nFalta4
nFaltasTotais += nFaltaFinal

// se reprovado por notas ou faltas nessa materia
if nNotaFinal < nSerieMediaMinima .or. nFaltaFinal > nSerieFaltaMaxima
	if nNotaFinal < nSerieMediaMinima
		cCorNotaFinal := cCorReprova
	endif
	if nFaltaFinal > nSerieFaltaMaxima
		cCorFaltaFinal := cCorReprova
	endif

	nMateriasReprovadas++
	cMateriasReprovadas += cMateriaA + ' '
	cCorStatusMateria   := cCorReprova
	cStatusMateria      := 'Reprovado' 
endif

@ nLinha, 20 + (nColuna++ * 4) say nNotaFinal     picture '999' color cCorNotaFinal
@ nLinha, 20 + (nColuna++ * 4) say nFaltaFinal    picture '999' color cCorFaltaFinal
@ nLinha, 20 + (nColuna++ * 4) say cStatusMateria               color cCorStatusMateria

// resetando os valores
nLinha            += 2
nColuna           := 0
nNota1            := 0
nNota2            := 0
nNota3            := 0
nNota4            := 0
nFalta1           := 0
nFalta2           := 0
nFalta3           := 0
nFalta4           := 0
cCorFaltaFinal    := cCorAprova
cCorNotaFinal     := cCorAprova
cCorStatusMateria := cCorAprova
cStatusMateria    := 'Aprovado'

// MATERIA B
@ nLinha, 20 + (nColuna++ * 4) get nNota1  picture '999' valid nNota1 >= 0 .and. nNota1 <= 100
@ nLinha, 20 + (nColuna++ * 4) get nFalta1 picture '999' valid nFalta1 >= 0
@ nLinha, 20 + (nColuna++ * 4) get nNota2  picture '999' valid nNota2 >= 0 .and. nNota2 <= 100
@ nLinha, 20 + (nColuna++ * 4) get nFalta2 picture '999' valid nFalta2 >= 0
@ nLinha, 20 + (nColuna++ * 4) get nNota3  picture '999' valid nNota3 >= 0 .and. nNota3 <= 100
@ nLinha, 20 + (nColuna++ * 4) get nFalta3 picture '999' valid nFalta3 >= 0
@ nLinha, 20 + (nColuna++ * 4) get nNota4  picture '999' valid nNota4 >= 0 .and. nNota4 <= 100
@ nLinha, 20 + (nColuna++ * 4) get nFalta4 picture '999' valid nFalta4 >= 0
read

nNotaFinal    := (nNota1 + nNota2 + nNota3 + nNota4) / 4
nFaltaFinal   := nFalta1 + nFalta2 + nFalta3 + nFalta4
nFaltasTotais += nFaltaFinal

// se reprovado por notas ou faltas nessa materia
if nNotaFinal < nSerieMediaMinima .or. nFaltaFinal > nSerieFaltaMaxima
	if nNotaFinal < nSerieMediaMinima
		cCorNotaFinal := cCorReprova
	endif
	if nFaltaFinal > nSerieFaltaMaxima
		cCorFaltaFinal := cCorReprova
	endif

	nMateriasReprovadas++
	cMateriasReprovadas += cMateriaB + ' '
	cCorStatusMateria   := cCorReprova
	cStatusMateria      := 'Reprovado' 
endif

@ nLinha, 20 + (nColuna++ * 4) say nNotaFinal     picture '999' color cCorNotaFinal
@ nLinha, 20 + (nColuna++ * 4) say nFaltaFinal    picture '999' color cCorFaltaFinal
@ nLinha, 20 + (nColuna++ * 4) say cStatusMateria               color cCorStatusMateria

// resetando os valores
nLinha            += 2
nColuna           := 0
nNota1            := 0
nNota2            := 0
nNota3            := 0
nNota4            := 0
nFalta1           := 0
nFalta2           := 0
nFalta3           := 0
nFalta4           := 0
cCorFaltaFinal    := cCorAprova
cCorNotaFinal     := cCorAprova
cCorStatusMateria := cCorAprova
cStatusMateria    := 'Aprovado'

// MATERIA C
@ nLinha, 20 + (nColuna++ * 4) get nNota1  picture '999' valid nNota1 >= 0 .and. nNota1 <= 100
@ nLinha, 20 + (nColuna++ * 4) get nFalta1 picture '999' valid nFalta1 >= 0
@ nLinha, 20 + (nColuna++ * 4) get nNota2  picture '999' valid nNota2 >= 0 .and. nNota2 <= 100
@ nLinha, 20 + (nColuna++ * 4) get nFalta2 picture '999' valid nFalta2 >= 0
@ nLinha, 20 + (nColuna++ * 4) get nNota3  picture '999' valid nNota3 >= 0 .and. nNota3 <= 100
@ nLinha, 20 + (nColuna++ * 4) get nFalta3 picture '999' valid nFalta3 >= 0
@ nLinha, 20 + (nColuna++ * 4) get nNota4  picture '999' valid nNota4 >= 0 .and. nNota4 <= 100
@ nLinha, 20 + (nColuna++ * 4) get nFalta4 picture '999' valid nFalta4 >= 0
read

nNotaFinal    := (nNota1 + nNota2 + nNota3 + nNota4) / 4
nFaltaFinal   := nFalta1 + nFalta2 + nFalta3 + nFalta4
nFaltasTotais += nFaltaFinal

// se reprovado por notas ou faltas nessa materia
if nNotaFinal < nSerieMediaMinima .or. nFaltaFinal > nSerieFaltaMaxima
	if nNotaFinal < nSerieMediaMinima
		cCorNotaFinal := cCorReprova
	endif
	if nFaltaFinal > nSerieFaltaMaxima
		cCorFaltaFinal := cCorReprova
	endif

	nMateriasReprovadas++
	cMateriasReprovadas += cMateriaC + ' '
	cCorStatusMateria   := cCorReprova
	cStatusMateria      := 'Reprovado'
endif

@ nLinha, 20 + (nColuna++ * 4) say nNotaFinal     picture '999' color cCorNotaFinal
@ nLinha, 20 + (nColuna++ * 4) say nFaltaFinal    picture '999' color cCorFaltaFinal
@ nLinha, 20 + (nColuna++ * 4) say cStatusMateria               color cCorStatusMateria

Inkey(0)


// cor do total de faltas
if nFaltasTotais >= 8
	if nFaltasTotais < 16
		cCorFaltasNoAno := cCorDependencia
	else
		cCorFaltasNoAno := cCorReprova
	endif
endif

if nMateriasReprovadas > 0
	if nMateriasReprovadas <= 2
		cStatusAno    := 'Aprovado, com dependencia(s)'
		cCorStatusAno := cCorDependencia
		
		// aumento de 20% por DP
		nMensalidade          += (nMensalidade * 0.2) * nMateriasReprovadas
		cMensalidadeAdicional := ' (+' + AllTrim(Str(nMateriasReprovadas * 20)) + '%)'
	else
		cStatusAno    := 'Reprovado'
		cCorStatusAno := cCorReprova
	endif
endif

@ 17,02 say 'Resultados'
@ 18,02 say 'Aluno............: ' + cNome
@ 19,02 say 'Curso............: ' + cCurso
@ 18,50 say 'Serie............: ' + AllTrim(Str(nSerie))
@ 20,02 say 'Status...........: '
@ 21,02 say 'Faltas totais....: '
@ 22,02 say 'Disciplinas em DP: '

@ 20,21 say cStatusAno                  color cCorStatusAno
@ 21,21 say AllTrim(Str(nFaltasTotais)) color cCorFaltasNoAno
@ 22,21 say cMateriasReprovadas         color cCorDependencia

if nMateriasReprovadas > 0 .and. nMateriasReprovadas < 3
	@ 23,02 say 'Nova mensalidade.: ' + Transform(nMensalidade, '@E 9999.99')
	@ 23,28 say cMensalidadeAdicional color cCorReprova
endif

Inkey(0)