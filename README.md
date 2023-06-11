# E-commerce 
  Este é um projeto de API para um e-commerce de jogos.
  Foi projetado pensando principalmente em produtos de jogos, com entrega digital..
  Preciso avisar que ainda está em andamento. Portanto, se você precisa de algo completo, ainda não está pronto.

## Tecnologias utilizadas
  - Rails 6.0.3.3
  - Postgres
  - Devise Token Auth para autenticação
  - Jbuilder para renderização

## Como usá-lo?
  Basicamente, temos alguns endpoints que podem ser usados por usuários com permissões específicas.

  Temos dois perfis no aplicativo: admin e client.

  Admin é a pessoa responsável por gerenciar tudo. Ele pode fazer o CRUD de Categoria, Produto, Requisitos do sistema e Licença.
  Client é o perfil permitido a fazer um pedido.
  E também temos rotas não autenticadas para listas de produtos e pesquisas.

## Construindo a aplicação
  Ok, então primeiro você deve ter:

  1. Postgres instalado.
  2. Ruby >= 2.5.0 instalado (mínimo necessário para Rails 6.0.3.3, versão com a qual estamos trabalhando).
  3. Como estamos no início do projeto, não se esqueça de configurar corretamente o seu `database.yml`.
  4. E para fazer o bundle com o comando:
    ```
    bundle install
    ```

  Assim que tudo estiver pronto, você pode seguir.

### 1. Tarefa para construir o ambiente de desenvolvimento
  Você pode opcionalmente executar esta tarefa para configurar todo o ambiente de desenvolvimento e criar alguns dados de teste.
    ```
      rails dev:prime
    ```

### 2. Construindo manualmente tudo
  Se você quiser fazer tudo manualmente e criar seu ambiente de desenvolvimento e dados, é possível seguir o caminho usual.

  1. Criar bancos de dados
    ```
    rails db:create
    ```

  2. Executar migrações
    ```
    rails db:migrate
    ```

  3. Iniciar o servidor
    ```
    rails s
    ```

  Se você quiser executar testes:
  ```
  bundle exec rspec
  ```

## Como posso usar a API?
  Bom, temos um arquivo aqui se você quiser importar no Postman.

  [Arquivo Postman](https://drive.google.com/file/d/1p0vJ7h5IlF3k_HcsnUq8TAihB_Y6uH0P/view?usp=sharing)

  Também há um modelo de banco de dados em PDF e em um arquivo Navicat.

  [PDF](https://drive.google.com/file/d/1Vw8RvgfswVDQMF7IrI-psJ4s5X6_aqiR/view?usp=sharing) |
  [Arquivo Navicat](https://drive.google.com/file/d/1avsMHPC2_S2Fr3jmnVnfJvXhrkVevCQA/view?usp=sharing)

### Escopos
  Temos 3 escopos principais:

  - **/auth**
  - **/admin**
  - **/storefront**

  E cada escopo tem sua própria versionamento. Por exemplo, temos **/admin/v1**, **/auth/v1** e assim por diante.
  Neste momento, **/admin/v1** está em desenvolvimento e **/auth/v1** já está concluído. **/storefront** é o nosso próximo passo para 
começar.

### Autenticação
  No **/auth/v1**, estamos usando **Devise Token Auth** para autenticação com a técnica de Token Refresh.
  É stateless e para fazer login, você precisa enviar usuário e senha e receberá cabeçalhos que deve enviar em suas requisições para as 
APIs. Esses cabeçalhos são:

  - *access-token*
  - *client*
  - *expiry*
  - *token-type*
  - *uid*

  A cada solicitação feita, *access-token* muda e você receberá um novo no cabeçalho de resposta para ser enviado na próxima 
solicitação. É assim que funciona o Token Refresh.

  Se você quiser saber mais sobre o **Devise Token Auth**, pode acessar [seu repositório](https://github.com/lynndylanhurley/devise_token_auth).

### Serialização da API
  Para serializar dados, não estamos usando nenhum padrão de renderização JSON. Como esta aplicação tem como objetivo funcionar apenas
com ferramentas específicas e não ser uma API pública, não vimos a necessidade de adotar nenhum desses padrões. Você pode verificar a estrutura que estamos usando em `app/views`.







