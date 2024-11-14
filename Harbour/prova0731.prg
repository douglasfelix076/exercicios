// Douglas felix dos Santos Moreira

set date to british
set epoch to 1940
set message to 23 center
set wrap on

// variaveis
nEscolha       := 0
lUsuarioValido := .f. // tela de login
cLoginUsuario  := 'ADMIN'
cLoginSenha    := '123mudar'

//cores
cCorVerde    := 'G+/N'
cCorVermelho := 'R+/N'
cCorAzul     := 'BG/N'

// mascaras
cMascaraValor      := '@E 999.99'
cMascaraQTD        := '999'
cMascaraPercentual := '99.99'
cMascaraTexto      := '@!'

clear
@ 00,00 to 24,79 double
@ 22,01 to 22,78

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
   @ 06,14 get cSenha   valid !Empty(cSenha) color 'W/W'
   read

   if LastKey() == 27
      nOpcao := Alert('Sair do programa?', { 'Sim', 'Nao' })
      if nOpcao == 1
         exit
      endif

      loop
   endif

   if AllTrim(cUsuario) == cLoginUsuario .and. AllTrim(cSenha) == cLoginSenha
      lUsuarioValido := .t.
   else
      Alert('Senha ou usuario incorretos. Tente novamente!')
   endif
enddo

// inicio do programa
do while lUsuarioValido
   nContadorOrdem  := 1

   @ 01,01 clear to 21,78
   @ 02,02 prompt 'Efetuar pedidos' message 'Iniciar um novo pedido'
	@ 03,02 prompt 'Sair'            message 'Sair do programa'
	menu to nEscolha

   @ 01,01 clear to 23,78

	if nEscolha == 0 // ESC
		nEscolha := 2

   elseif nEscolha == 1 // Efetuar pedidos
      nValorTotalOrdem := 0
      nComissaoTecnico := 0
      cCorTotalPedido  := cCorVerde

      do while .t.
         cNomeCliente         := Space(40)
         dOrdemServico        := CToD('')
         cNomeTecnico         := Space(30)
         cDescricaoEquipmento := Space(40)
         dCompra              := CToD('')
         cEntregaDomicilio    := ' '
         nLimite              := 0
         cEndereco            := Space(30)
         cBairro              := Space(30)
         cReferencia          := Space(30)
         nTelefone            := 0
         lCompraIniciada      := .f.
         lCompraFinalizada    := .f.
         nLinha               := 1

         @ 01,01 clear to 23,78
         @ 02,02 say 'Pedido n' + AllTrim(Str(nContadorOrdem))
         @ 04,02 say 'Nome do cliente..........:'
         @ 05,02 say 'Data da ordem de servico.:'
         @ 06,02 say 'Nome do tecnico..........:'
         @ 07,02 say 'Descricao do equipamento.:'
         @ 08,02 say 'Data da compra...........:'
         @ 09,02 say 'Entrega domicilio?.......:   [S]im [N]ao'
         @ 10,02 say 'Limite...................:'

         @ 04,29 get cNomeCliente         picture cMascaraTexto valid !Empty(cNomeCliente)
         @ 05,29 get dOrdemServico                              valid !Empty(dOrdemServico)
         @ 06,29 get cNomeTecnico         picture cMascaraTexto valid !Empty(cNomeTecnico)
         @ 07,29 get cDescricaoEquipmento picture cMascaraTexto valid !Empty(cDescricaoEquipmento)
         @ 08,29 get dCompra                                    valid !Empty(dCompra) .and. dCompra <= dOrdemServico
         @ 09,29 get cEntregaDomicilio    picture cMascaraTexto valid cEntregaDomicilio $ 'SN'
         @ 10,29 get nLimite              picture cMascaraValor valid nLimite > 0
         read

         if LastKey() == 27
            nOpcao := Alert('Voltar?', { 'Sim', 'Nao' })
            if nOpcao == 1
               exit
            endif

            loop
         endif

         cNomeCliente         := AllTrim(cNomeCliente)
         cNomeTecnico         := AllTrim(cNomeTecnico)
         cDescricaoEquipmento := AllTrim(cDescricaoEquipmento)

         if cEntregaDomicilio == 'S'
            @ 12,02 say 'Endereco.................:'
            @ 13,02 say 'Bairro...................:'
            @ 14,02 say 'Referencia...............:'
            @ 15,02 say 'Telefone.................:'

            @ 12,29 get cEndereco   picture cMascaraTexto valid !Empty(cEndereco)
            @ 13,29 get cBairro     picture cMascaraTexto valid !Empty(cBairro)
            @ 14,29 get cReferencia picture cMascaraTexto valid !Empty(cReferencia)
            @ 15,29 get nTelefone   picture '99999999'    valid Len(AllTrim(Str(nTelefone))) == 8
            read

            if LastKey() == 27
               nOpcao := Alert('Voltar?', { 'Sim', 'Nao' })
               if nOpcao == 1
                  exit
               endif

               loop
            endif

            cEndereco   := AllTrim(cEndereco)
            cBairro     := AllTrim(cBairro)
            cReferencia := AllTrim(cReferencia)
         endif

         lCompraIniciada := .t.
         exit
      enddo

      @ 01,01 clear to 23,78
      @ 16,01 to 16,78
      @ 17,35 to 23,35

      do while lCompraIniciada
         cDescricaoProduto := Space(30)
         cDescricaoServico := Space(25)
         nQTD              := 0
         nValor            := 0
         nValorTotal       := 0
         nComissao         := 0
         nDesconto         := 0
         cTipoOrdem        := ' '
         lPermissao        := .f.

         @ 17,02 say 'Total do pedido.:'
         @ 18,02 say 'Limite..........:'
         @ 17,20 say nValorTotalOrdem picture cMascaraValor color cCorTotalPedido
         @ 18,20 say nLimite          picture cMascaraValor color cCorVerde

         @ nLinha+01,02 clear to nLinha+03,77
         @ nLinha+01,02 say '[P]roduto [S]ervico : '
         @ nLinha+01,25 get cTipoOrdem picture cMascaraTexto valid cTipoOrdem $ 'PS'
         read

         if LastKey() == 27
            nOpcao := Alert('O que deseja fazer?', { 'Finalizar a compra', 'Cancelar a compra', 'Continuar' })

            if nOpcao == 1 // finalizar a compra
               lCompraFinalizada := .t.
               exit
            elseif nOpcao == 2 // cancelar a compra
               exit
            endif

            loop
         endif

         if cTipoOrdem == 'P'
            @ nLinha,02 say 'Produto'
            @ nLinha+01,02 say 'Descricao do produto            QTDE  VALOR  %DESC   TOTAL'

            @ nLinha+02,02 get cDescricaoProduto picture cMascaraTexto      valid !Empty(cDescricaoProduto)
            @ nLinha+02,34 get nQTD              picture cMascaraQTD        valid nQTD > 0
            @ nLinha+02,39 get nValor            picture cMascaraValor      valid nValor > 0
            @ nLinha+02,47 get nDesconto         picture cMascaraPercentual valid nDesconto >= 0
            read

         else
            @ nLinha,02 say 'Servico'
            @ nLinha+01,02 say 'Descricao do servico                  VALOR  %DESC           TOTAL'
            @ nLinha+03,02 say 'Comissao do tecnico: '

            @ nLinha+02,02 get cDescricaoServico picture cMascaraTexto      valid !Empty(cDescricaoServico)
            @ nLinha+02,39 get nValor            picture cMascaraValor      valid nValor > 0
            @ nLinha+02,47 get nDesconto         picture cMascaraPercentual valid nDesconto >= 0
            @ nLinha+03,23 get nComissao         picture cMascaraPercentual valid nDesconto >= 0
            read

         endif

         if LastKey() == 27
            nOpcao := Alert('O que deseja fazer?', { 'Finalizar a compra', 'Cancelar a compra', 'Continuar' })

            if nOpcao == 1 // finalizar a compra
               lCompraFinalizada := .t.
               exit
            elseif nOpcao == 2 // cancelar a compra
               exit
            endif

            loop
         endif

         nAnosDeUso := Year(dOrdemServico) - Year(dCompra)

         if cTipoOrdem == 'P' .and. nAnosDeUso > 2
            nValorTotal := nQTD * nValor

         elseif cTipoOrdem == 'S' .and. nAnosDeUso > 1
            nValorTotal := nValor

         endif

         nValorTotal      -= nValorTotal * nDesconto / 100
         nValorTotalOrdem += nValorTotal
         nComissaoTecnico += nValorTotalOrdem * nComissao / 100

         @ nLinha+02,67 say nValorTotal picture cMascaraValor color cCorVerde

         if nValorTotalOrdem > nLimite
            do while !lPermissao
               cUsuario := Space(15)
               cSenha   := Space(15)

               @ 17,40 say 'Permissao do supervisor'
               @ 19,40 say 'Usuario.:'
               @ 20,40 say 'Senha...:'
               @ 19,50 get cUsuario valid !Empty(cUsuario)
               @ 20,50 get cSenha   valid !Empty(cSenha)   color 'W/W'
               read

               if LastKey() == 27
                  nOpcao := Alert('Cancelar ultimo servico/ordem?', { 'Sim', 'Nao' })
                  if nOpcao == 1
                     exit
                  endif

                  loop
               endif

               if AllTrim(cUsuario) == 'SUPERVISOR' .and. AllTrim(cSenha) == '123LIBERA'
                  lPermissao      := .t.
                  cCorTotalPedido := cCorVermelho
                  exit
               else
                  Alert('Senha incorreta. Tente novamente!')
               endif
            enddo

            @ 17,40 clear to 23,78
            if !lPermissao
               Alert('Compra/Servico revogado')
               loop
            endif
         endif

         nLinha += 4
         if nLinha >= 12
            Inkey(0)
            @ 05,01 clear to 23,78
            @ 16,01 to 16,78
            @ 17,35 to 23,35
            nLinha := 1
         endif
      enddo

      @ 01,01 clear to 23,78

      do while lCompraFinalizada
         cFormaPagamento  := ' '
         cTextoValorTotal := ''
         nCNPJ            := 0
         nNota            := 0
         dNota            := dOrdemServico

         @ 03,03 say 'Forma de pagamento...:   [D]inheiro [C]artao Che[q]ue'
         @ 03,26 get cFormaPagamento picture cMascaraTexto valid cFormaPagamento $ 'DCQ'
         read

         if LastKey() == 27
            nOpcao := Alert('Cancelar a venda?', { 'Sim', 'Nao' })
            if nOpcao == 1
               exit
            endif

            loop
         endif

         if nValorTotalOrdem == 0
            cTextoValorTotal := 'Valor pago pela garantia'
         else
            cTextoValorTotal := Transform(nValorTotalOrdem, cMascaraValor)
         endif

         @ 05,03 say 'Valor total da ordem.: ' + cTextoValorTotal color cCorVerde           color cCorAzul
         @ 06,03 say 'Equipamento..........: ' + cDescricaoEquipmento                       color cCorAzul
         @ 07,03 say 'Tecnico..............: ' + cNomeTecnico                               color cCorAzul
         @ 08,03 say 'Comissao do tecnico..: ' + Transform(nComissaoTecnico, cMascaraValor) color cCorAzul
         @ 09,03 say 'Local de Entrega.....: ' + cBairro + ', ' + cEndereco                 color cCorAzul
         @ 10,03 say 'Referencia...........: ' + cReferencia                                color cCorAzul

         if nValorTotalOrdem == 0
            @ 12,03 say 'Dados da nota fiscal'
            @ 13,03 say 'CNPJ da empresa......: '
            @ 14,03 say 'Numero da nota.......: '
            @ 15,03 say 'Data da nota.........: '

            @ 13,26 get nCNPJ picture '99999999999999' valid Len(AllTrim(Str(nCNPJ))) == 14
            @ 14,26 get nNota picture '9999999999'     valid Len(AllTrim(Str(nNota))) == 10
            @ 15,26 get dNota                          valid dNota >= dOrdemServico
            read

            if LastKey() == 27
               nOpcao := Alert('Cancelar a venda?', { 'Sim', 'Nao' })
               if nOpcao == 1
                  exit
               endif

               loop
            endif
         endif

         @ 20,03 say 'Obrigado pela sua compra! '
         nLimite -= nValorTotalOrdem
         nContadorOrdem++

         Inkey(0)
      enddo
   endif
enddo