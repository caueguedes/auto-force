# README

Postmand Api documentation: [Documentation](https://www.getpostman.com/collections/3efab90286afbc0666fb)

Deploy foi realizado na amazon ec2 em um node de swarm no ip: 54.233.164.91

Tools | Ferramentas
--------- | ------
ruby        | 2.7.1 alpine
rails       | 6.0

### Deployment instructions

- docker-compose up -d (will bind to localhost port 3000)

### Database creation

- docker-compose exec web bash bin/rails db:create

### Running tests

- docker-compose exec web bundle exec rspec
- rspec


## Additional Stuff?

### A security layer

Para um ambiente em microsserviços eu optaria por uma abordagem utilizando um provedor de identificação(IsP) com Json web Token(JWT). Um serviço responsável pela autenticação e gerenciamento de usuários.

Uma implementação rápida de um IdP pode ser criada utilizando as Gems DoorKeeper e Devise.


### A permission layer

Utilizando a abordagem de Role Based Access Control (RBAC) utilizando funções (roles) para limitar o acesso baseado na função designada ao usuário.

Você pode alcançar esse objetivo adicionando ao IdP uma gem como o pundit ou cancan, adicionando ao gerenciamento de usuário a capacidade de gerenciar roles.

### Modify orders in production

A abordagem utilizada no projeto entregue foi a utilização de uma camada de serviço responsável por realizar o comportamento (criar ordem, gerar batch,...). 

Nesse caso criaria um serviço realizar a tratativa. Pegando a ordem checando o status, se ainda é possível a troca, se sim remover o pedido da produção e gerar uma nova outra com o pedido correto. 


### A web UI

Com o JWT é possível utilizar várias abordagens para desenvolver o front-end, a que eu escolheria seria utilização de uma biblioteca como o react ou angular. 

Os componentes gerados podem ser utilizados em um ambiente móvel posteriormente.
