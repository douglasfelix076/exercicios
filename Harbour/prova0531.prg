// Douglas Felix dos Santos Moreira

set date to british
set epoch to 1940
set message to 23 center
set wrap on


// variaveis
nEscolha        := 0
nPedidoContador := 1
lUsuarioValido  := .f. // tela de login

// estoques
nEstoqueA := 110
nEstoqueB := 198.5
nEstoqueC := 445
nEstoqueD := 200

//cores
cCorVerde := 'G+/N'
cCorAzul  := 'BG/N'

// mascaras
cMascaraValor := '@E 99,999.99'


clear
@ 00,00 to 24,79 double
@ 22,01 to 22,78
@ 00,02 say 'Frutaria Douglas'

// tela de login
@ 02,02 to 09, 50
@ 02,04 say 'L O G I N'
@ 03,04 say 'Digite suas informacoes de login'
@ 05,04 say 'Usuario.:'
@ 06,04 say 'Senha...:'

do while !lUsuarioValido
   cUsuario := Space(20)
   cSenha   := Space(20)

   @ 05,14 get cUsuario valid !Empty(cUsuario)
   @ 06,14 get cSenha   valid !Empty(cSenha)
   read

   if LastKey() == 27
      nOpcao := Alert('Sair do programa?', { 'Sim', 'Nao' })
      if nOpcao == 1
         exit
      endif

      loop
   endif

   if AllTrim(cUsuario) == 'Felix123' .and. AllTrim(cSenha) == 'ademin#1'
      lUsuarioValido := .t.
   else 
      Alert('Senha ou usuario incorretos. Tente novamente!')
   endif
enddo

// inicio do programa
do while .t.
   @ 01,01 clear to 21,78
   @ 02,02 prompt 'Efetuar pedidos' message 'Iniciar um novo pedido'
	@ 03,02 prompt 'Sair'            message 'Sair do programa'
	menu to nEscolha

   @ 23,01 clear to 23,78 // apaga a mensagem abaixo apos uma opcao ser escolhida

	if nEscolha == 0 // ESC
		nEscolha := 2
   
   elseif nEscolha == 1 // Efetuar pedidos
      @ 01,01 clear to 21,78
      @ 03,01 to 03,78

      cNomeCliente       := Space(20)
      nLimite            := 0
      dPedido            := Date()
      nProdutosComprados := 0
      nValorTotalPedido  := 0
      lCompraIniciada    := .f.
      lCompraFinalizada  := .f.
      nLinha             := 0
   
      // salva o numero de produtos a ser reduzido do estoque separadamente
      // para nao subtrair do estoque case o usuario cancele o pedido
      nEstoqueReducaoA := 0
      nEstoqueReducaoB := 0
      nEstoqueReducaoC := 0
      nEstoqueReducaoD := 0
      
      @ 01,02 say 'Nome:'
      @ 01,29 say 'Limite:'
      @ 02,02 say 'Data do pedido:'
      @ 01,49 say 'Pedido n' + AllTrim(Str(nPedidoContador))
      @ 01,47 to 02,47
      
      // informações do cliente
      do while .t.
         @ 01,08 get cNomeCliente picture '@!'          valid !Empty(cNomeCliente)
         @ 01,37 get nLimite      picture cMascaraValor valid nLimite >= 0
         @ 02,18 get dPedido                            valid !Empty(dPedido) .and. dPedido <= Date() + 7                           
         read

         if LastKey() == 27
            nOpcao := Alert('Voltar?', { 'Sim', 'Nao' })
            if nOpcao == 1
               exit
            endif

            loop
         endif

         lCompraIniciada := .t.
         exit
      enddo

      @ 04,02 say 'Code   QTD   %Desc   Descricao                  Valor       Total'
      @ 05,21 to 21,21

      do while lCompraIniciada
         nCodigo        := 0
         nQtde          := 0
         nValor         := 0
         nDesconto      := 0
         nTotal         := 0
         cTextoDesconto := '' // mostra um texto ao lado do valor do total quando há desconto

         // informações do produto
         cProdutoDescricao   := ''
         nProdutoValor       := 0
         nProdutoDescontoMax := 0
         nProdutoEstoque     := 0

         if nLinha == 16
            Inkey(0)
            @ 05,01 clear to 21,78
            @ 05,21 to 21,21
            nLinha := 0
         endif
         
         @ 02,49 say 'Total do pedido:'
         @ 02,66 say nValorTotalPedido picture cMascaraValor color cCorVerde

         @ 06+nLinha,02 get nCodigo   picture '9999' valid nCodigo > 0
         @ 06+nLinha,09 get nQtde     picture '999'  valid nQtde > 0
         @ 06+nLinha,15 get nDesconto picture '999'  valid nDesconto >= 0 .and. nDesconto <= 100
         read
            
         if LastKey() == 27
            nOpcao := Alert('O que deseja fazer?', { 'Finalizar a compra', 'Cancelar a compra', 'Continuar' })
            
            if nOpcao == 1 // finalizar a compra
               if nProdutosComprados > 0
                  lCompraFinalizada := .t.
                  exit
               endif
               
               Alert('Digite ao menos 1 produto para finalizar a compra')
               loop
            elseif nOpcao == 2 // cancelar a compra
               exit
            endif
            
            loop
         endif
         
         if nCodigo == 5500
            cProdutoDescricao    := 'Amora preta'
            nProdutoValor        := 1.5
            nProdutoDescontoMax  := 12
            nProdutoEstoqueAtual := nEstoqueA - nEstoqueReducaoA

         elseif nCodigo == 7744
            cProdutoDescricao    := 'Uva Rubi'
            nProdutoValor        := 8
            nProdutoDescontoMax  := 11
            nProdutoEstoqueAtual := nEstoqueB - nEstoqueReducaoB

         elseif nCodigo == 4445
            cProdutoDescricao    := 'Pepino'
            nProdutoValor        := 3.99
            nProdutoDescontoMax  := 2
            nProdutoEstoqueAtual := nEstoqueC - nEstoqueReducaoC
            
         elseif nCodigo == 6565
            cProdutoDescricao    := 'Morango'
            nProdutoValor        := 15.49
            nProdutoDescontoMax  := 6
            nProdutoEstoqueAtual := nEstoqueD - nEstoqueReducaoD

         else
            Alert('Codigo de produto invalido.')
            loop
         endif

         nTotal := nQtde * nProdutoValor
         nTotal -= nTotal * (nDesconto / 100)

         if nQtde > nProdutoEstoqueAtual
            Alert('Estoque insuficiente para este produto (' + AllTrim(Str(nProdutoEstoqueAtual)) + ' restantes).')
            loop
         endif
         
         if nDesconto > nProdutoDescontoMax
            Alert('Desconto acima do limite para este produto (maximo de ' + AllTrim(Str(nProdutoDescontoMax)) + '%).')
            loop
         endif

         if nValorTotalPedido + nTotal > nLimite
            Alert('Limite estourado.')
            loop
         endif

         if nDesconto > 0
            cTextoDesconto := ' -' + AllTrim(Str(nDesconto)) + '% desc'
         endif

         @ 06+nLinha,23 say cProdutoDescricao                                 color cCorAzul
         @ 06+nLinha,46 say nProdutoValor picture cMascaraValor               color cCorVerde
         @ 06+nLinha,58 say Transform(nTotal, cMascaraValor) + cTextoDesconto color cCorVerde

         if nCodigo == 5500
            nEstoqueReducaoA += nQtde

         elseif nCodigo == 7744
            nEstoqueReducaoB += nQtde

         elseif nCodigo == 4445
            nEstoqueReducaoC += nQtde

         else
            nEstoqueReducaoD += nQtde
         endif

         nValorTotalPedido += nTotal
         nProdutosComprados++
         nLinha += 2
      enddo

      if lCompraFinalizada
         nPedidoContador++
         nEstoqueA -= nEstoqueReducaoA
         nEstoqueB -= nEstoqueReducaoB
         nEstoqueC -= nEstoqueReducaoC
         nEstoqueD -= nEstoqueReducaoD
         nLimite   -= nValorTotalPedido

         @ 01,01 clear to 21,78
         @ 02,02 say 'Obrigado pela sua compra!'
         
         @ 04,02 say 'Nome do cliente.:'
         @ 05,02 say 'Data do pedido..:'
         @ 06,02 say 'Total do pedido.:'
         @ 07,02 say 'Novo limite.....:'
         @ 04,20 say cNomeCliente                            color cCorAzul
         @ 05,20 say DToC(dPedido)                           color cCorAzul
         @ 06,20 say nValorTotalPedido picture cMascaraValor color cCorVerde
         @ 07,20 say nLimite           picture cMascaraValor color cCorVerde

         @ 20,02 say 'Pressione qualquer tecla para continuar.....'
         Inkey(0)
      endif

   elseif nEscolha == 2 // Sair
      exit
   endif
enddo