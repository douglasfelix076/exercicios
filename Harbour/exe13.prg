// parte visual
clear
set scoreboard off
@ 00,00 to 24,79 double
@ 00,02 say 'exe13'

nCodigo        := 0
cClassificacao := ''
@ 01,02 say 'Digite o codigo do produto:'

@ 01,30 get nCodigo picture '999' valid nCodigo > 0
read

if nCodigo == 1 // 1
    cClassificacao = 'Alimento nao-perecivel'
elseif nCodigo <= 4 // 2-4
    cClassificacao = 'Alimento perecivel'
elseif nCodigo <= 6 // 5-6
    cClassificacao = 'Vestuario'
elseif nCodigo == 7 // 7
    cClassificacao = 'Higiene pessoal'
elseif nCodigo <= 15 // 8-15
    cClassificacao = 'Limpeza e utensilios domesticos'
endif

if (cClassificacao == '')
    @ 03,02 say 'Codigo de produto invalido.'
else
    @ 03,02 say 'Classificacao do produto: ' + cClassificacao + '.'
endif

@ 23,02 say 'Pressione qualquer tecla para continuar...'
Inkey(0)