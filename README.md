# Travel Planner — v0.1.0 (MVP financeiro)

Aplicativo web pessoal em português, com interface escura e responsiva. Código aberto no repositório que você criar, dados financeiros locais. Sem login, servidor de banco de dados, IA ou conta adicional. Nenhuma conexão bancária. Todos os valores de demonstração ficam fora do aplicativo: ele começa vazio.

## Publicar pelo navegador no GitHub (sem terminal)

1. Descompacte `Travel-Planner-v0.1.0.zip` no Finder. Dentro da pasta `travel-planner`, você verá `index.html`, `style.css`, `src`, `tests`, `docs`, os ícones, o manifesto e o service worker. Não envie o ZIP em si.
2. Entre em https://github.com/new. Nome sugerido: `travel-planner`. Marque **Public** (Pages com GitHub Free requer repositório público). Marque **Add a README file** para criar a branch `main`. Clique **Create repository**.
3. No repositório, clique **Add file → Upload files**. No Finder selecione TODOS os arquivos e pastas de dentro de `travel-planner` (não a pasta externa). Arraste-os para a área de upload. A raiz do repositório deve conter `index.html`, `style.css`, `src/`, `manifest.webmanifest`, `sw.js`, etc. O README fornecido pode substituir o inicial.
4. Clique **Commit changes**. Se o Finder não mostrar `.nojekyll`, use `Cmd + Shift + .` para mostrar arquivos ocultos. Se não conseguir enviar, no GitHub clique **Add file → Create new file**, nome `.nojekyll`, e faça commit. Esse arquivo desativa o processamento Jekyll.
5. Vá a **Settings → Pages** (na barra lateral). Em **Build and deployment**, selecione **Deploy from a branch**. Branch **main**, pasta **/(root)**. Clique **Save**.
6. Acompanhe a aba **Actions** e retorne a **Settings → Pages** para obter o endereço publicado. O formato usual é `https://SEU-USUARIO.github.io/travel-planner/`. Não é um endereço já criado.
7. Abra o endereço no Mac. No iPhone, abra no Safari, toque em Compartilhar → Adicionar à Tela de Início (se disponível) → Adicionar. Abra o ícone criado. A primeira abertura deve ter internet para baixar os arquivos. Verifique se funciona offline depois, antes de viajar.

Documentação oficial: https://docs.github.com/pt/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site

**Não publique dados pessoais, exportações JSON, CSV, comprovantes, planilhas reais ou credenciais no repositório.** O site e o código são públicos. Os registros ficam no navegador/dispositivo, sem criptografia própria. Uma pessoa com acesso ao dispositivo pode acessá-los. O endereço do site não é uma proteção de acesso.

## Primeiros passos

1. Perfil → Editar perfil. Cadastre nome, pessoas habituais e parâmetros desejados (opcionais).
2. Carteira → + Cartão / conta. Adicione os cartões que realmente possui (Crédito ou Débito), contas internacionais e uma carteira física (Dinheiro) se quiser controlar o saldo em espécie. Pix é forma de pagamento, normalmente vinculada à conta de débito opcional. Não informe número completo, CVV, senha nem token.
3. Carteira → + Compra / saldo inicial. Informe quanto pagou em reais (incluindo taxas) e quanto recebeu na moeda estrangeira. O custo médio da conta é calculado automaticamente. Compras de moeda não são despesas de viagem. Transferência/saque preserva o custo de aquisição.
4. Viagens → + Nova viagem. Informe tipo, situação, destino, datas se conhecidas, participantes, orçamento-limite opcional e meios de pagamento. Escolha os cartões que vai levar. Em viagem internacional, selecione moeda principal. Em Configuração, cadastre outros destinos com períodos não sobrepostos.
5. Grupos → + Grupo / + Participante se houver outras famílias. Os integrantes do próprio grupo não dividem o orçamento entre si. Nas despesas escolha divisão só minha família, igual entre grupos, por pessoas ou percentual personalizado.
6. Planejamento → + Despesa (geral ou datada), + Gastos diários (limite por categoria) ou + Hospedagem (gera cafés incluídos do dia seguinte ao check-in até o checkout). Os valores previstos podem ficar em branco. Não some um limite diário de alimentação geral com limites separados para as refeições nos mesmos dias; use um ou outro.
7. No dia da viagem: Resumo → Registrar gasto. Para uma despesa planejada individual, use Lançar na própria linha; para um limite diário, use Novo gasto, que cria despesa avulsa. Isso mantém os gastos vinculados ao dia e à categoria. Selecione Crédito, Débito, Dinheiro ou Pix. A seleção de cartões da viagem tem prioridade. No caso de conta pré-paga, marque descontar do saldo e informe o valor realmente debitado e sua moeda. Pagamentos divididos permitem duas partes em reais, sem baixa de saldo de conta nesta versão.
8. Resumo: confira realizado, previsão final, saldo e margem. A readequação altera despesas flexíveis futuras proporcionalmente; as protegidas não mudam. O original fica registrado. Para orçamento diário sem previsão real, um lançamento independente pode consumir o limite da mesma categoria (Alimentação geral cobre café, almoço, jantar e lanches). Limites de dias anteriores sem uso deixam de ser compromissos.
9. Para concluir, edite a viagem e mude o status para Concluída. Análises mostra gastos efetivos do seu grupo, separados por nacional/internacional, médias por lançamento e número de observações. Não é IA nem inferência sobre preços locais. Os gastos médios ficam disponíveis para consulta ao planejar novas viagens; não há autoajuste de parâmetros nesta versão.
10. Perfil → Exportar backup JSON. Guarde em pasta pessoal no iCloud Drive/Finder (não GitHub). Para mover para outro dispositivo, exporte a versão mais recente e restaure no outro. Restauração **substitui** os dados, não mescla; mantenha um dispositivo por vez como versão principal. Faça backup antes de restaurar. CSV pode ser aberto no Excel/Numbers, mas não é um backup completo.

## Câmbio

- Frankfurter v2, https://frankfurter.dev/pt/ — cotação de referência, sem cadastro/chave. Consulta pública envia somente moeda e data, não valor ou informações pessoais.
- Automático busca a taxa mais recente disponível para a data; fins de semana/feriados podem ter taxa anterior. A data efetiva aparece na tela. Sem resultado, tenta cache anterior e informa a data. Personalizado permite informar o preço efetivamente pago/cotação conhecida. Não há garantia de câmbio turismo, pois depende da instituição, IOF e tarifas.
- Os dois campos são editáveis. A última moeda editada é a âncora. Para manter um planejamento em reais, prefira BRL como moeda original. Para manter preço de ingresso em USD, selecione USD e digite o preço estrangeiro. Atualizar câmbio no planejamento atualiza somente previsões automáticas em moeda estrangeira ancoradas nessa moeda e ainda não realizadas.
- O gasto realizado conserva a cotação registrada; lançamentos baixados da carteira utilizam o custo médio do saldo. Uma correção retroativa de compra de moeda ou baixa pode recalcular custos das baixas posteriores; faça backup antes. Para cartão de crédito, corrija o câmbio personalizado após saber a cobrança efetiva.
- Para visualizar COP e BRL ao mesmo tempo, selecione COP mesmo se o valor originalmente informado for em reais. Na moeda nacional, BRL é a taxa 1.

## O que está pronto / o que ainda não está

Esta é uma primeira versão de desenvolvimento, não um sistema financeiro homologado. O motor tem testes automatizados; a interface precisa de validação em navegador real e Safari/iPhone, e a cotação ao vivo precisa de teste após publicar. O ambiente de desenvolvimento bloqueou a navegação automatizada e não permitiu validar a integração real.

Inclui: perfil local, participantes, grupos, contas/cartões, quatro meios de pagamento, seleção por viagem, planejamento geral e diário, hospedagem/café, câmbio bidirecional, custo médio, transferências/saques, registro de despesas, resumo dinâmico, análise de consumo, backup/CSV, PWA com cache offline dos arquivos.

Limitações: armazenamento localStorage (isolado por origem/navegador) em vez de IndexedDB; não há sincronização automática, login, criptografia própria ou integração bancária. Não importa XLSX; orçamento inicial deve ser cadastrado manualmente. Sem calendário turístico, mapas, pesquisa de redes sociais ou IA. Sem controle formal de reembolsos pagos, parcelas de cartão e estornos; ajustes de hospedagem que alteram período exigem excluir/recriar a reserva (com cuidado para manter despesas reais); sem criação automática de preços por destino; relatórios de perfil inicialmente simples, sem normalização por viajante, país ou sazonalidade. Pagamento dividido limita-se a duas partes sem baixa de saldo. A atualização automática de câmbio é feita ao abrir um novo lançamento e manualmente pelo botão de atualizar, não por processo em segundo plano. Alguns pares de moedas podem não estar disponíveis na API. O offline precisa ser verificado no dispositivo.

## Atualizar o código

Faça backup JSON. Envie somente arquivos atualizados para o mesmo repositório (Add file → Upload files), commit na main; Pages republica. Mantenha o mesmo endereço para preservar os dados locais. Não envie a pasta de backup ou a planilha real.

## Desenvolvedor

Sem dependências de terceiros ou etapa de build. `src/engine.js` tem regras financeiras puras; `src/storage.js` encapsula persistência e cotação; `src/app.js` tem telas e comandos; `style.css` design; `manifest.webmanifest` e `sw.js` PWA. `tests/engine.test.js` testes com Node 18+. Execute `npm test`. Para testar localmente, com Python instalado, execute `python3 -m http.server 8000` na raiz e abra `http://localhost:8000`. Não é necessário instalar Node ou Python para publicar via GitHub.

Migração: dados versionados em JSON; adaptador de persistência separado. Para migrar a outro domínio/host, exporte e restaure o backup. Futuro backend deve acrescentar autenticação, autorização por usuário, migrações e sincronização. Atualizar a versão do cache do service worker a cada release que altere ativos.

Consulte `docs/VALIDACAO.md` para o roteiro de teste antes de usar em viagem.
