// Douglas Felix dos Santos Moreira

set date to british
set epoch to 1930
set scoreboard off
set color to 'N/W+'

clear
@ 00,00 to 24,79 double

nOrdem             := 0
nContador          := 0
nLinha             := 0
nCNPJ              := 0
nNota              := 0
nQTDE              := 0
nValor             := 0
nDesconto          := 0
nValorTotal        := 0
nComissao          := 0
nComissaoTotal     := 0
nAnosDeUso         := 0
cNomeCliente       := Space(50)
cNomeTecnico       := Space(40)
cDescricaoEquip    := Space(50)
cDescricao         := Space(30)
dDataCompra        := CToD('')
dDataNota          := Date()
dDataOrdem         := Date()
cEscolha           := ' '
cGarantia          := ''
cMascaraTexto      := '@!'
cMascaraValor      := '@E 999,999.99'
cMascaraValorTotal := '@E 9,999,999.99'
cMascaraPercentual := '999.99'
cCorDestaque       := 'N/W'
cCorTotal          :=  'B+/W'
lGarantiaProduto   := .t.
lGarantiaServico   := .t.
lFinalizar         := .f. // finaliza o loop

@ 02,02 say 'Insira as informacoes'
@ 03,02 say 'Ordem de servico.....:'
@ 04,02 say 'Nome do cliente......:'
@ 05,02 say 'Data da ordem........:'
@ 06,02 say 'Nome do tecnico......:'
@ 07,02 say 'Descricao equipamento:'
@ 08,02 say 'Data da compra.......:'

@ 03,25 get nOrdem          picture '999999'      valid nOrdem > 0
@ 04,25 get cNomeCliente    picture cMascaraTexto valid !Empty(cNomeCliente)
@ 05,25 get dDataOrdem                            valid dDataOrdem <= Date()
@ 06,25 get cNomeTecnico    picture cMascaraTexto valid !Empty(cNomeTecnico)
@ 07,25 get cDescricaoEquip picture cMascaraTexto valid !Empty(cDescricaoEquip)
@ 08,25 get dDataCompra                           valid dDataOrdem <= Date()
read

cNomeCliente := AllTrim(cNomeCliente)
cNomeTecnico := AllTrim(cNomeTecnico)
nAnosDeUso   := Year(Date()) - Year(dDataCompra)

if (Month(Date()) < Month(dDataCompra) .or. (Month(Date()) = Month(dDataCompra) .and. Day(Date()) < Day(dDataCompra)))
   nAnosDeUso--
endif

lGarantiaProduto := nAnosDeUso <= 2
lGarantiaServico := nAnosDeUso <= 1

@ 20,02 say 'Pressione qualquer tecla para continuar...'
inkey(0)

@ 01,01 clear to 23,78
@ 04,01 to 23,70
do while !lFinalizar
   @ 01,01 clear to 23,78
   @ 02,02 say 'O que deseja processar? (P)roduto - (S)ervico'

   cEscolha := ' '
   @ 03,02 get cEscolha picture cMascaraTexto valid cEscolha $ 'SP'
   read

   if (LastKey() = 27)
      nOpcao := Alert('Deseja finalizar a compra?', { 'Sim', 'Nao' }, cCorDestaque)
      if (nOpcao = 1)
         exit
      endif
   endif

   // mensagem extra da garantia
   cGarantia := '.'
   if (cEscolha = 'P')
      if (lGarantiaProduto)
         cGarantia := ' - Garantia ativa.'
      endif

      @ 03,02 say 'Produto' + cGarantia color cCorDestaque
      @ 05,06 say 'Descricao                       QTDE      Preco    Desc        Total'
   else
      if (lGarantiaServico)
         cGarantia := ' - Garantia ativa.'
      endif

      @ 03,02 say 'Servico' + cGarantia color cCorDestaque
      @ 05,06 say 'Descricao                       Desconto  Comissao       Total'
   endif

   nContador := 1
   nLinha    := 0
   do while .t.
      @ 02,50 say 'Valor total: $' + Transform(nValorTotal, cMascaraValorTotal) color cCorDestaque

      // controle de linhas
      if (nLinha >= 9)
         nLinha := 0
         @ 06,02 clear to 23,78
      endif

      cDescricao := Space(30)
      nQTDE      := 0
      nValor     := 0
      nComissao  := 0
      nDesconto  := 0

      @ 07+nLinha*2,02 say nContador picture '99'
      if (cEscolha = 'P')
         @ 07+nLinha*2,05 get cDescricao picture cMascaraTexto      valid !Empty(cDescricao)
         @ 07+nLinha*2,39 get nQTDE      picture '999'              valid nQTDE > 0
         @ 07+nLinha*2,43 get nValor     picture cMascaraValor      valid nValor > 0
         @ 07+nLinha*2,55 get nDesconto  picture cMascaraPercentual valid nValor > 0
         read

         if (LastKey() = 27)
            nOpcao := Alert('O que deseja fazer?', { 'Trocar o servico', 'Continuar', 'Finalizar a ordem' }, cCorDestaque)
            if (nOpcao = 1)
               exit
            elseif (nOpcao = 3)
               lFinalizar := .t.
               exit
            endif
         endif

         if (lGarantiaProduto)
            nValor := 0
         else
            nValor *= nQTDE * (100 - nDesconto) / 100
            nValorTotal += nValorTotal
         endif

         @ 07+nLinha*2,62 say nValor picture cMascaraValorTotal color cCorTotal
      elseif (cEscolha = 'S')
         @ 07+nLinha*2,05 get cDescricao picture cMascaraTexto      valid !Empty(cDescricao)
         @ 07+nLinha*2,40 get nDesconto  picture cMascaraPercentual valid nDesconto >= 0
         @ 07+nLinha*2,50 get nComissao  picture cMascaraPercentual valid nComissao >= 0
         @ 07+nLinha*2,58 get nValor     picture cMascaraValor      valid nValor >= 0        color cCorTotal
         read

         if (LastKey() = 27)
            nOpcao := Alert('O que deseja fazer?', { 'Trocar o servico', 'Continuar', 'Finalizar a ordem' }, cCorDestaque)
            if (nOpcao = 1)
               exit
            elseif (nOpcao = 2)
               loop
            elseif (nOpcao = 3)
               lFinalizar := .t.
               exit
            endif
         endif

         nValor *=  (100 - nDesconto) / 100
         nComissaoTotal += nValor * nDesconto / 100
         if (!lGarantiaServico)
            nValorTotal += nValor
         endif
      endif

      nContador++
      nLinha++
   enddo
enddo

@ 01,01 clear to 23,78
@ 02,02 say 'Obrigado pela sua compra!'
@ 04,02 say 'Equipamento: '
@ 04,15 say cDescricaoEquip color cCorDestaque

if (nValorTotal = 0)
   @ 05,02 say 'Preco total cobrido pela garantia'
   @ 06,02 say 'Nota fiscal...:'
   @ 07,02 say 'Numero da nota:'
   @ 08,02 say 'Data da nota..:'

   @ 06,17 get nCNPJ     picture '99999999999999' valid Len(AllTrim(Str(nCNPJ))) = 14
   @ 07,17 get nNota     picture '999999999'      valid nNota >= 0
   @ 08,17 get dDataNota                          valid dDataNota
   read
else
   @ 05,02 say 'Preco total: $'
   @ 05,16 say AllTrim(Transform(nValorTotal,cMascaraValorTotal)) color cCorDestaque
endif

@ 04,34 say 'Comissao para o tecnico ' + cNomeTecnico + ': $' + Alltrim(Transform(nComissaoTotal,cMascaraValorTotal))
@ 20,02 say 'Pressione qualquer tecla para continuar...'
inkey(0)
clear


