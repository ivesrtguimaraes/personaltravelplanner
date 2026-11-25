# Validação inicial — v0.1.0

Use dados fictícios antes de registrar dados reais. Se algo não funcionar, anote tela, passo, resultado, aparelho e mensagem. Não compartilhe backup real nem dados sensíveis.

## Teste A — perfil e viagem
- Criar nome de teste, esposa e filho. Cadastrar cartão de crédito, Wise (débito), Nomad (débito) e carteira em espécie.
- Criar viagem internacional Colômbia de 5 a 9 de dezembro (5 dias), com 3 participantes, grupo único, COP e limite R$ 3.000. Selecionar somente Wise e cartão de crédito. Confirmar que Nomad não aparece na lista padrão; marcar mostrar cartões fora da seleção deve exibi-lo se Débito.
- Criar outra família com dois participantes. Lançar Airbnb R$ 4.000, dividir igualmente entre grupos. Minha parte R$ 2.000. Alterar para proporcional às pessoas: R$ 2.400. Alterar para personalizada 60/40: R$ 2.400. Restaurar divisão igual.

## Teste B — compra de moeda, conversão e saldo
- Na Wise, registrar compra de 540.000 COP por R$ 1.000; nova compra 1.120.000 COP por R$ 2.000. Saldo 1.660.000 COP, custo R$ 3.000.
- Lançar despesa de 100.000 COP, Débito Wise, baixar saldo em COP de 100.000. Esperado: custo R$ 180,72 (média), saldo 1.560.000 COP; não somar compra de moeda ao gasto da viagem.
- Registrar transferência de saldo entre carteiras; verificar que custo total preservado, sem entrar no orçamento.
- Planejar ingresso 100 USD em taxa personalizada R$ 5,50 por USD: previsão R$ 550. Alterar BRL para 600: USD deve mudar. Testar automático e verificar data e fonte. Não presumir que cotação de referência seja turismo.
- Desconectar internet; verificar que, após primeira abertura online, o app continua acessível e oferece cache/manual no câmbio. Reabra app e confira dados.

## Teste C — controle de gastos
- Criar viagem de teste separada (datas atuais/futuras), sem compartilhamento. Criar limite diário de Alimentação geral R$ 300 para hoje. Registrar almoço R$ 180, pela ação Novo gasto ou avulso em categoria Almoço. Previsão restante desse limite R$ 120, sem duplicação.
- Cadastrar hospedagem de 5 a 9/12 com café incluído: quatro cafés de custo zero (6, 7, 8, 9). Se desejar café fora, lance gasto avulso ou use Lançar.
- Testar Pix e crédito; registrar pagamento dividido sem baixa de saldo. Registrar gasto acima do previsto e verificar previsão final/saldo. Proteger uma despesa, readequar e verificar que ela não muda.
- Mudar status para Concluída. Abrir Análises e conferir que apenas realizado da própria responsabilidade aparece, separado por tipo de viagem.

## Teste D — backups e dispositivos
- Exportar backup JSON de dados fictícios. Fechar/reabrir. Verificar persistência. Restaurar no outro aparelho. Confirmar que restauração substitui registros e que não há sincronização automática. Verificar exportação CSV no Excel/Numbers. Não use JSON em repositório público.

## Testes já executados no desenvolvimento
- `npm test`: 11 testes do motor financeiro aprovados (divisão, cotação, previsão, acerto, custo médio, transferência, saldo insuficiente, café incluído, análise, backup e limite diário).
- `node --check`: módulos sem erros de sintaxe.
- Navegação automatizada bloqueada pelo ambiente de execução (ERR_BLOCKED_BY_ADMINISTRATOR). UI, cotação ao vivo e instalação offline ainda não foram homologadas.
