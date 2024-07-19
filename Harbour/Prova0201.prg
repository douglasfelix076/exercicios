// Douglas Felix dos Santos Moreira

set scoreboard off
set color to 'N/W+'
set date to british

nEscolha         := 0 // menu
nLimite          := 0
nQtd             := 0
nCodigo          := 0
nDesc            := 0
nDescMaximo      := 0
nProdutoLinha    := 0
nContador        := 1
nEstoque         := 0
nEstoqueA        := 155
nEstoqueB        := 117.50
nEstoqueC        := 859
nTotalGeral      := 0
nTotalProduto    := 0
nEndereco        := 0
nTelefone        := 0
nValor           := 0
cEntrega         := ' '
cUsuario         := Space(10)
cSenha           := Space(10)
cNomeCliente     := Space(30)
cBairro          := Space(30)
cReferencia      := Space(30)
cProduto         := ''
cCorTexto        := 'N/W'
cCorDinheiro     := 'G/W'
cCorAlerta       := 'N/W'
cMascaraTexto    := '@!'
cMascaraValor    := '@E 9.99'
cMascaraTotal    := '@E 9,999.99'
cMascaraTelefone := '(99) 9 99999999'
dDataVenda       := Date()

clear
@ 02,00 to 24,79 double
@ 00,00 to 24,79 double
@ 01,02 say 'Frutaria Douglas'

@ 05,06 to 13,44
@ 05,12 say 'LÄOÄGÄIÄN'
@ 07,12 say 'Digite suas Credenciais'
@ 08,12 say 'Usuario:'
@ 09,12 say 'Senha..:'

do while .t.

   @ 08,21 get cUsuario picture cMascaraTexto valid !Empty(cUsuario)
   @ 09,21 get cSenha   picture cMascaraTexto valid !Empty(cSenha)
   read

   if (cUsuario != 'ADMIN' .or. cSenha != 'TESTE123')
      @ 11,12 say 'Usuario ou senha incorretos.' color 'R/W'
      loop
   endif

   exit
enddo

do while .t.
   nEscolha := 0

   @ 03,01 clear to 23,78
   @ 04,02 say 'O que deseja fazer?'
   @ 06,02 say '1. Efetuar pedido'
   @ 07,02 say '2. Sair'

   @ 04,22 get nEscolha picture '9' valid nEscolha = 1 .or. nEscolha = 2
   read

   if (nEscolha = 1)
      nTotalGeral  := 0
      nLimite      := 0
      nEndereco    := 0
      nTelefone    := 0
      cEntrega     := ' '
      cNomeCliente := Space(30)
      cBairro      := Space(30)
      cReferencia  := Space(30)
      dDataVenda   := Date()

      do while .t.

         @ 03,01 clear to 23,78

         @ 04,02 say 'Insira seus dados'
         @ 05,02 say 'Nome.........:'
         @ 06,02 say 'Limite.......:'
         @ 07,02 say 'Entrega (S/N):'
         @ 08,02 say 'Data da venda:'

         @ 05,17 get cNomeCliente picture cMascaraTexto valid !Empty(cNomeCliente)
         @ 06,17 get nLimite      picture cMascaraTotal valid nLimite >= 0
         @ 07,17 get cEntrega     picture cMascaraTexto valid cEntrega $ 'SN'
         @ 08,17 get dDataVenda                         valid dDataVenda >= Date()
         read
         if (LastKey() = 27)
            nOpcao := Alert('Deseja voltar para o menu?', { 'Sim', 'Nao' }, cCorAlerta)
            if (nOpcao = 1)
               exit
            endif
         endif

         if (cEntrega = 'S')
            @ 10,02 say 'Informacoes da entrega'
            @ 11,02 say 'Endereco..:'
            @ 12,02 say 'Bairro....:'
            @ 13,02 say 'Referencia:'
            @ 14,02 say 'Telefone..:'
            @ 16,02 say 'Sujeito a taxa de entrega ($5,00)'

            @ 11,14 get nEndereco   picture '999'            valid nEndereco > 0
            @ 12,14 get cBairro     picture cMascaraTexto    valid !Empty(cBairro)
            @ 13,14 get cReferencia picture cMascaraTexto    valid !Empty(cReferencia)
            @ 14,14 get nTelefone   picture cMascaraTelefone valid Len(AllTrim(Str(nTelefone))) = 11
            read
            if (LastKey() = 27)
               nOpcao := Alert('Deseja voltar para o menu?', { 'Sim', 'Nao' }, cCorAlerta)
               if (nOpcao = 1)
                  exit
               endif
            endif

            // taxa de entrega
            nTotalGeral += 5
         endif

         @ 20,02 say 'Pressione qualquer tecla para continuar...'
         inkey(0)

         @ 03,01 clear to 23,78

         @ 04,07 say 'CODIGO ³ QTD | Desc ³ Produto                 ³ Valor ³    TOTAL'
         @ 05,04 to 19,75
         @ 05,02 to 05,77
         @ 19,02 to 19,77

         do while .t.
            // apaga os produtos e reinicia a posicao da lista
            if (nProdutoLinha > 6)
               nProdutoLinha := 0
               @ 06,01 clear to 18,03
               @ 06,07 clear to 18,74
            endif

            nCodigo := 0
            nQtd    := 0
            nDesc   := 0

            @ 08+nProdutoLinha*2,05 clear to 06+nProdutoLinha*2,74 // apaga o conteudo da linha do produto atual
            @ 08+nProdutoLinha*2,01 say nContador                                               picture '999' color cCorTexto
            @ 20,08 say 'Total Da Compra: R$' + Transform(nTotalGeral, cMascaraTotal)                         color cCorDinheiro
            @ 21,08 say 'Limite Restante: R$' + Transform(nLimite - nTotalGeral, cMascaraTotal)               color cCorDinheiro
            @ 07+nProdutoLinha*2,05 to 07+nProdutoLinha*2,74

            @ 06+nProdutoLinha*2,09 get nCodigo picture '9999' valid nCodigo > 0
            @ 06+nProdutoLinha*2,16 get nQtd    picture '999'  valid nQtd > 0
            @ 06+nProdutoLinha*2,24 get nDesc   picture '99'   valid nDesc >= 0
            read

            if (LastKey() = 27)
               nOpcao := Alert('Deseja finalizar a compra?', { 'Sim', 'Nao' }, cCorAlerta)
               if (nOpcao = 1)
                  exit
               endif
            endif

            if (nCodigo = 1500)
               cProduto    := 'Banana Prata'
               nValor      := 01.50
               nDescMaximo := 20
               nEstoque    := nEstoqueA
            elseif (nCodigo = 2501)
               cProduto    := 'Pera Argentina'
               nValor      := 09.00
               nDescMaximo := 15
               nEstoque    := nEstoqueB
            elseif (nCodigo = 3001)
               cProduto    := 'Batata Peruana'
               nValor      := 05.00
               nDescMaximo := 10
               nEstoque    := nEstoqueC
            else
               Alert('Codigo de produto nao identificado (' + AllTrim(Str(nCodigo)) + ')', cCorAlerta)
               loop
            endif

            @ 06+nProdutoLinha*2,29 say cProduto
            @ 06+nProdutoLinha*2,56 say nValor   picture cMascaraValor

            if (nTotalGeral + nTotalProduto > nLimite)
               Alert('Credito insuficiente ($' + AllTrim(Str(nLimite)) + ').', cCorAlerta)
               loop
            endif

            if (nQtd > nEstoque)
               Alert('Estoque insuficiente para este produto (' + AllTrim(Str(nEstoque)) + ').', cCorAlerta)
               loop
            endif

            if (nDesc > nDescMaximo)
               Alert('Limite de desconto estourado para este produto (' + AllTrim(Str(nDescMaximo)) + '%).', cCorAlerta)
               loop
            endif

            // compra confirmada ate esse ponto

            nTotalProduto = nQtd * nValor * ((100-nDesc)/100)

            if (nCodigo = 1500)
               nEstoqueA -= nQtd
            elseif (nCodigo = 2501)
               nEstoqueB -= nQtd
            elseif (nCodigo = 3001)
               nEstoqueC -= nQtd
            endif

            nTotalGeral += nTotalProduto

            @ 06+nProdutoLinha*2,63 say nTotalProduto picture cMascaraTotal color cCorDinheiro

            nProdutoLinha++
            nContador++
         enddo

         // finalizacao
         nLimite -= nTotalGeral

         @ 03,01 clear to 23,78

         if (cEntrega = 'S')
            @ 10,03 say 'O pedido sera entregue em: ' + AllTrim(cBairro) + ', '+ AllTrim(Str(nEndereco)) + '.' color cCorTexto
         endif

         @ 03,01 to 17,68
         @ 17,01 say Replicate('/\', 34)
         @ 05,03 say 'Obrigado pela sua compra!'                                       color cCorTexto
         @ 07,03 say 'Valor total....: $' + Transform(nTotalGeral,cMascaraTotal) + '.' color cCorTexto
         @ 08,03 say 'Limite restante: $' + Transform(nLimite,cMascaraTotal) + '.'     color cCorTexto

         @ 20,02 say 'Pressione qualquer tecla para continuar...'
         inkey(0)

         nOpcao := Alert('Iniciar um novo pedido?', { 'Sim', 'Nao' }, cCorAlerta)
         if (nOpcao = 2)
            exit
         endif
      enddo
   elseif (nEscolha = 2)
      exit
   endif
enddo

clear
