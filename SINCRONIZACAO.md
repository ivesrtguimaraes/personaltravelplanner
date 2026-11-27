# Personal Travel Planner 1.3.1 — sincronização

**Antes de qualquer atualização: exporte o backup JSON do Mac e guarde-o no iCloud Drive ou em pasta privada. Se houver registros no iPhone, exporte-os também.** Não envie backups ao GitHub. Mantenha o mesmo repositório, endereço e navegador.

## 1. Configurar o Supabase (uma vez)

1. Acesse https://supabase.com/dashboard e entre com o GitHub. Crie uma organização no plano Free se solicitado.
2. Clique em New project. Use o nome `personal-travel-planner`, escolha região próxima (São Paulo se disponível), gere uma senha forte para o banco e guarde-a no gerenciador de senhas. Escolha Free, sem complementos pagos. Essa senha não é a senha do aplicativo.
3. No projeto, abra SQL Editor > New query. Copie integralmente o conteúdo de `SUPABASE.sql`, cole e clique Run. Deve terminar sem erros. A tabela usa RLS, com leitura e gravação restritas ao identificador do usuário autenticado. Não desative RLS.
4. Abra Authentication > Users > Add user > Create new user (os rótulos podem variar). Crie seu usuário pessoal com e-mail e senha forte exclusiva, confirmando seu próprio e-mail pelo controle Auto Confirm User, se disponível. Não use a senha do banco. Não compartilhe senhas no chat nem no GitHub. Não há cadastro público dentro do app.
5. Em Authentication > Sign In / Providers (ou Settings), mantenha o provedor Email habilitado e desative Allow new users to sign up e Allow anonymous sign-ins. Mantenha a confirmação de e-mail habilitada. Se a criação administrativa do usuário não estiver disponível, não desative essas proteções para contornar: consulte a ajuda do Supabase.
6. No botão Connect ou em Project Settings > API Keys, copie a Project URL (`https://<ref>.supabase.co`) e a chave **Publishable** iniciada por `sb_publishable_`. Nunca copie `sb_secret_`, `service_role`, senha de banco ou token pessoal. A URL e a chave publicável podem constar no código público; a RLS e a autenticação protegem os registros.

Documentação: https://supabase.com/docs/guides/getting-started/api-keys ; https://supabase.com/docs/guides/auth/general-configuration ; https://supabase.com/docs/guides/auth/users

## 2. Publicar a atualização

Descompacte o ZIP. Abra `src/cloud-config.js` em um editor de texto simples ou use o editor de arquivos do GitHub após o upload. Substitua as strings vazias pela sua URL e chave publicável, mantendo as aspas:

```js
export const cloudConfig={url:'https://SEU-PROJETO.supabase.co',key:'sb_publishable_SUA_CHAVE'};
```

Não use as palavras de exemplo literalmente. Não mude a chave de armazenamento local. Envie os arquivos e pastas da versão 1.3.1 à raiz do **mesmo** repositório, substituindo os anteriores, e faça commit. Se já tiver configurado cloud-config.js, preserve sua configuração em futuras atualizações. `SUPABASE.sql` contém somente a estrutura e políticas, sem dados pessoais. Não envie nenhum JSON de backup.

Aguarde a publicação em Actions; abra o endereço existente e confira a versão 1.3.1. Recarregue a página se ainda exibir a anterior. Não apague dados do navegador. A versão funciona sem configuração de nuvem também.

## 3. Primeiro envio — SOMENTE NO MAC

1. Confira seus dados existentes antes do login. Se não aparecerem, pare e confira o endereço/navegador ou importe o backup previamente exportado.
2. Perfil > Sincronização Mac e iPhone > Entrar na minha conta. Use o e-mail e senha do usuário criado em Authentication, não as credenciais administrativas do Supabase.
3. Quando aparecer “Nuvem vazia”, escolha **Usar dados deste aparelho**. Confirme. Aguarde “Sincronizado”. Não envie os dados de um aparelho vazio primeiro.
4. No iPhone, abra o mesmo URL (ou o app instalado), confira versão 1.3.1 e entre com o mesmo e-mail e senha. Se não houver dados locais, os dados do Mac serão carregados. Se houver registros diferentes, o app mostrará conflito: não escolha uma versão sem exportar ambas e conferir quais registros precisam ser preservados.
5. Faça um teste com um lançamento fictício no iPhone. Aguarde a indicação Sincronizado, confira no Mac e exclua o teste. Repita em sentido inverso. Exporte backup depois da confirmação.

## 4. Como funciona

A cada alteração salva, o app tenta enviar a cópia completa do perfil, viagens, contas, despesas, movimentos, poupança e parcelas. Consulta mudanças quando abre, volta ao primeiro plano, recupera internet e aproximadamente a cada 20 segundos enquanto aberto. Não sincroniza em segundo plano com o app fechado. Funciona sem internet com os dados locais, mas a primeira autenticação e o primeiro carregamento exigem internet. O serviço gratuito pode pausar após inatividade; restaure o projeto no painel se necessário. Não há serviços pagos adicionais.

O código guarda uma revisão da cópia remota e seu hash. Uma atualização só substitui a revisão esperada. Se os dois dispositivos tiverem alterações independentes, o app interrompe a sincronização; esta versão não faz mesclagem registro a registro. No Perfil é possível escolher uma versão e exportar ambas. Cópias de recuperação ficam também no dispositivo; exporte para local privado. Não use os dois aparelhos offline para editar ao mesmo tempo. Evite várias abas do app abertas. O armazenamento local e a sessão permanecem no aparelho; sair da nuvem não apaga o perfil local. Use somente aparelhos pessoais protegidos. Backups não criptografados; os dados não têm criptografia ponta a ponta nesta versão.

## 5. Validação e limitações

24 testes Node aprovados (16 financeiros e 8 de sincronização com servidor simulado). Sintaxe JavaScript verificada. O Supabase real, políticas no seu projeto e o navegador/iPhone não foram testados neste ambiente. Valide com dados fictícios antes de depender da sincronização em uma viagem. Mantenha exportações JSON periódicas mesmo com a nuvem. Não há garantia de disponibilidade permanente do plano gratuito. A estrutura usa uma cópia JSON por usuário para preservar o modelo atual; pode migrar para tabelas relacionais no futuro. As limitações financeiras da v0.2 continuam aplicáveis.
