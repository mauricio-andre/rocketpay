<h1 align="center">
  Rocketpay
</h1>

<h2 align="center">
  Uma API construída com elixir que simula transações monetárias entre usuários
</h2>

<p align="center">
  <a href="#sobre-o-projeto">Sobre o projeto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#get-started">Get Started</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#mais-sobre-docker">Mais sobre docker</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#vs-code">Vs Code</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#rotas-da-api">Rotas da API</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#licença">Licença</a>
</p>

---

## Sobre o projeto

Este projeto foi desenvolvido durante o quarto evento Next Level Week (NLW) promovido pela rocketseat. O evento NLW é conduzido durante o período de uma semana por um dos educators da rocketseat que guia o aprendizado durante esse período, a quarta edição deste evento trouxe de forma inédita uma trilha de conhecimento de elixir.

A API desenvolvida nesta semana simula as operações de transferências monetárias entre usuários, do mesmo modo como o aplicativo PicPay e outros fazem. É possível por meio desta API cadastrar novos usuários e consequentemente uma conta para tal, realizar depósitos e saques de quantias em dinheiro (evidentemente fictícias), e transferências de dinheiro entre usuários cadastrados na ferramenta.

Aprendemos na construção deste projeto a instalar o elixir, o phoenix e o banco de dados postgres para a preservação dos dados cadastrados pela API, bem como a configuração para integração entre o banco de dados e a aplicação elixir.

Durante o evento, aprendemos a criar testes automatizados em elixir no modelo de testes unitários e testes de integração, estes testes foram realizados para controllers, views e funcionalidades da aplicação.

## Get Started

Para executar este projeto é necessário possuir o elixir, o phoenix e o postgres instalados em seu ambiente, para a comodidade do uso deste projeto, criei um ambiente docker com todos os recursos necessários para sua execução.

Caso você opte por executar este projeto por meio do container docker, será necessário ter instalado em seu ambiente o docker e o docker-compose.

### Se você estiver usando o docker

- Execute o comando `docker-compose up` para iniciar os containers dockers
- Para acessar o terminal dentro do container e executar os comandos da proxíma etapa execute `docker exec -it rocketpay_app bash`

### Se você não estiver usando o docker

- Tenha em seu banco de dados postgres um usuário com as seguintes credenciais postgres:postgres
- Crie um banco de dados com o nome "rocketpay_dev" (Ou mude o nome do banco nos arquivos de configuração do projeto). Você também pode executar `mix ecto.create` na raiz do projeto para criar a base de dados por meio do terminal
- Execute o comando `phx.server` no terminal da raiz do projeto para iniciar o servidor

### Procedimentos em comum

- Com seu servidor em execução execute no terminal o comando `mix ecto.migrate` para criar as tabelas no banco de dados
- Ao seguir os passos anteriores, a aplicação já está acessível por meio do endereço [http://localhost:4000](http://localhost:4000)
- Caso seja necessário baixar alguma dependência do projeto execute o comando `mix deps.get` no terminal que contem o elixir
- Para executar os testes automatizados execute o comando `mix test` no terminal que contem o elixir. Também é possível usar `mix test --cover` ou `mix coveralls.html`
- Caso precise executar algum comando no elixir como rotas da aplicação por meio do terminal, execute o comando `iex -S mix` para ter acesso a este recurso

## Mais sobre docker

Você pode querer usar o ambiente docker deste projeto para criar sua própria aplicação com elixir, para isso será necessário seguir as instruções abaixo

- Execute o comando `docker-compose build` para criar a imagem que sera usada no container
- Crie uma pasta chamado src na raiz do seu projeto ou execute o comando `mkdir src`
- Para criar o projeto execute o comando `docker-compose run --rm app mix phx.new . --app nome_do_projeto` o trecho `. --app` evita a criação do projeto dentro de uma pasta com o nome do mesmo. O nome `app` no comando corresponde ao nome do serviço em [docker-compose.yml](./docker-compose.yml)
- Por fim execute `docker-compose up` para iniciar seu novo projeto

Nota: este projeto foi criado com o comando `docker-compose run --rm app mix phx.new . --app rocketpay --no-webpack --no-html`

## VS Code

Caso você esteja usando o editor VS Code e executando seu projeto em um container docker, existe algumas alterações úteis que podem ser realizadas para facilitar o desenvolvimento.

Baixe a extensão *remote-containers* em seu editor, isso permite abrir o VS Code dentro do container que executa o elixir, essa ação é necessário para habilitar o intellisense da IDE e o Linter.

Dentro do diretório [.devcontainer](./.devcontainer) há um arquivo chamado [devcontainer.json](./.devcontainer/devcontainer.json), este arquivo contem as instruções de execução para a extensão *remote-containers* e vai instalar no VS Code dentro do docker duas extensões para facilitar o desenvolvimento com elixir.

## Rotas da API

A API construída possuí as seguintes rotas:

- **/api/users** - Rota POST para o cadastro de usuário enviando no corpo da requisição as seguintes informações { age, email, name, nickname, password }
- **/api/accounts/:id/deposit** - Rota para depositar valores em conta enviado na rota o id da conta e no corpo da requisição o valor a ser adicionado com o chave value
- **/api/accounts/:id/withdraw** - Rota para sacar valores em conta enviado na rota o id da conta e no corpo da requisição o valor a ser debitado com o chave value
- **/api/accounts/transaction** - Rota para transferir dinheiro entre contas enviando no corpo da requisição os seguintes valores { from, to, value }

A pasta [client](./client) contém arquivos de teste para as rotas desta API, os arquivos com extensão *.http* demonstram os parâmetros para a execução das rotas da API e podem realizar as requisições por meio da própria IDE. Caso você esteja utilizando o VS Code pode instalar a extensão *REST Client* e esse recurso será liberado.

## Licença
Esse projeto está sob licença MIT, veja o arquivo de [LICENSE](./LICENSE) para mais detalhes
