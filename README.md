Aqui está o `README.md` atualizado, incluindo informações sobre o uso do Docker, além dos endpoints de API para `categoria` e `receita`.

---

# Projeto de Receitas

Este projeto é uma aplicação de receitas que inclui uma API em Node.js (localizada na pasta `api/`) e um aplicativo cliente em Flutter (localizado na pasta `client/`). A API é responsável pelo backend da aplicação, fornecendo endpoints para gerenciar receitas e ingredientes, enquanto o cliente Flutter é o aplicativo frontend para consumir essa API.

## Sumário

- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Pré-requisitos](#pré-requisitos)
- [Configuração do Projeto](#configuração-do-projeto)
  - [Configuração da API](#configuração-da-api)
  - [Configuração do Cliente](#configuração-do-cliente)
- [Utilizando Docker](#utilizando-docker)
  - [Executando com Docker Compose](#executando-com-docker-compose)
  - [Parando e Removendo Containers](#parando-e-removendo-containers)
- [Scripts de Inicialização](#scripts-de-inicialização)
- [Endpoints da API](#endpoints-da-api)
  - [Endpoints de Categoria](#endpoints-de-categoria)
  - [Endpoints de Receita](#endpoints-de-receita)
- [Estrutura de Pastas](#estrutura-de-pastas)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Tecnologias Utilizadas

- **API (Backend)**: Node.js, Express.js, MongoDB, Mongoose
- **Cliente (Frontend)**: Flutter, Dart
- **Containers**: Docker e Docker Compose (para gerenciar MongoDB e API)

## Pré-requisitos

Certifique-se de ter as seguintes ferramentas instaladas:

- [Node.js](https://nodejs.org/) - versão 14 ou superior
- [Flutter](https://flutter.dev/) - versão estável mais recente
- [Docker](https://www.docker.com/) e [Docker Compose](https://docs.docker.com/compose/) - para configurar MongoDB e API em containers
- (Opcional) [MongoDB](https://www.mongodb.com/) - caso prefira rodar localmente sem Docker

## Configuração do Projeto

### Configuração da API

1. **Navegue até a pasta da API**:

   ```bash
   cd api/
   ```

2. **Instale as dependências**:

   ```bash
   npm install
   ```

3. **Crie um arquivo `.env` na pasta `api/` e configure as variáveis**:

   Exemplo de configuração:

   ```env
   PORT=3000
   MONGO_URI=mongodb://mongo:27017/recipe_db
   ```

4. **Inicialize a API**:

   ```bash
   npm start
   ```

   A API estará rodando em `http://localhost:3000`.

5. **(Opcional) Execute a API em modo de desenvolvimento**:

   Para usar o modo de desenvolvimento com monitoramento de alterações, instale o `nodemon` e inicie com:

   ```bash
   npm run dev
   ```

### Configuração do Cliente

1. **Navegue até a pasta do cliente**:

   ```bash
   cd client/
   ```

2. **Instale as dependências do Flutter**:

   ```bash
   flutter pub get
   ```

3. **Configure as variáveis de ambiente para a API no cliente**:

   Crie um arquivo `.env` na pasta `client/` e configure a URL da API:

   ```env
   API_URL=http://localhost:3000
   ```

4. **Inicialize o aplicativo Flutter**:

   ```bash
   flutter run
   ```

   O aplicativo será executado em um dispositivo ou emulador configurado.

## Utilizando Docker

### Executando com Docker Compose

Para simplificar a execução da API e do MongoDB em containers, você pode usar o Docker Compose. Já deve existir um arquivo `docker-compose.yml` configurado na raiz do projeto ou na pasta `api/` com a estrutura necessária.

1. **Crie o arquivo `docker-compose.yml`** (caso ainda não exista) na raiz do projeto ou na pasta `api/` com o seguinte conteúdo:

   ```yaml
   version: '3.8'
   services:
     mongo:
       image: mongo
       container_name: mongo
       ports:
         - "27017:27017"
       volumes:
         - mongo_data:/data/db

     api:
       build: ./api
       container_name: recipe-api
       ports:
         - "3000:3000"
       environment:
         - MONGO_URI=mongodb://mongo:27017/recipe_db
       volumes:
         - ./api:/usr/src/app
       depends_on:
         - mongo

   volumes:
     mongo_data:
   ```

2. **Execute o Docker Compose**:

   Na raiz do projeto ou na pasta onde o arquivo `docker-compose.yml` está localizado, execute:

   ```bash
   docker-compose up -d
   ```

   Isso iniciará os serviços do MongoDB e da API em containers no modo detached (em segundo plano).

### Parando e Removendo Containers

Para parar e remover os containers criados pelo Docker Compose, use o comando:

```bash
docker-compose down
```

Esse comando encerra e remove todos os containers definidos no `docker-compose.yml`, mantendo os dados do volume `mongo_data`.

## Scripts de Inicialização

### Na API

- **Iniciar em Produção**:

  ```bash
  npm start
  ```

- **Iniciar em Desenvolvimento (com nodemon)**:

  ```bash
  npm run dev
  ```

### No Cliente

- **Executar o aplicativo Flutter**:

  ```bash
  flutter run
  ```

## Endpoints da API

### Endpoints de Categoria

#### 1. Criar uma Nova Categoria

- **Endpoint**: `POST /api/categories`
- **Descrição**: Cria uma nova categoria de receita.
- **Exemplo de Requisição**:

  ```bash
  curl -X POST http://localhost:3000/api/categories \
    -H "Content-Type: application/json" \
    -d '{
          "description": "Salgado"
        }'
  ```

- **Exemplo de Resposta**:

  ```json
  {
    "_id": "60e8b58f1e4f4e6b5b3b9e4f",
    "description": "Salgado",
    "__v": 0
  }
  ```

#### 2. Listar Todas as Categorias

- **Endpoint**: `GET /api/categories`
- **Descrição**: Retorna uma lista de todas as categorias.
- **Exemplo de Requisição**:

  ```bash
  curl -X GET http://localhost:3000/api/categories
  ```

### Endpoints de Receita

#### 1. Criar uma Nova Receita

- **Endpoint**: `POST /api/recipes`
- **Descrição**: Cria uma nova receita sem ingredientes.
- **Exemplo de Requisição**:

  ```bash
  curl -X POST http://localhost:3000/api/recipes \
    -H "Content-Type: application/json" \
    -d '{
          "category_id": "<ID_DA_CATEGORIA>",
          "description": "Pão Caseiro",
          "howtomake": "Misture todos os ingredientes e asse.",
          "observations": "Asse por 40 minutos"
        }'
  ```

#### 2. Listar Todas as Receitas com Ingredientes

- **Endpoint**: `GET /api/recipes`
- **Descrição**: Retorna uma lista de todas as receitas, incluindo os ingredientes associados.
- **Exemplo de Requisição**:

  ```bash
  curl -X GET http://localhost:3000/api/recipes
  ```

#### 3. Adicionar Ingrediente a uma Receita

- **Endpoint**: `POST /api/recipes/:recipe_id/ingredients`
- **Descrição**: Adiciona um novo ingrediente a uma receita existente, associando-o pelo `recipe_id`.
- **Exemplo de Requisição**:

  ```bash
  curl -X POST http://localhost:3000/api/recipes/<ID_DA_RECEITA>/ingredients \
    -H "Content-Type: application/json" \
    -d '{
          "description": "Farinha",
          "obs": "Tipo 1",
          "unid": "g",
          "quantity": 500
        }'
  ```

#### 4. Excluir um Ingrediente de uma Receita

- **Endpoint**: `DELETE /api/recipes/:recipe_id/ingredients/:ingredient_id`
- **Descrição**: Exclui um ingrediente específico de uma receita com base nos IDs fornecidos.
- **Exemplo de Requisição**:

  ```bash
  curl -X DELETE http://localhost:3000/api/recipes/<ID_DA_RECEITA>/ingredients/<ID_DO_INGREDIENTE>
  ```

## Estrutura de Pastas

```plaintext
.
├── api/                # Backend da API em Node.js
│   ├── models/         # Modelos de dados (Mongoose)
│   ├── routes/         # Definição de rotas da API
│   ├── .env            # Variáveis de ambiente para API
│   ├── app.js          # Arquivo

 principal da API
│   └── package.json    # Dependências e scripts da API
└── client/             # Aplicativo cliente em Flutter
    ├── lib/            # Código principal do aplicativo Flutter
    ├── .env            # Variáveis de ambiente para o cliente Flutter
    ├── pubspec.yaml    # Dependências do Flutter
```

## Contribuição

1. Faça um fork do projeto.
2. Crie uma nova branch (`git checkout -b minha-feature`).
3. Faça commit das suas alterações (`git commit -m 'Adiciona minha feature'`).
4. Envie para o branch (`git push origin minha-feature`).
5. Abra um Pull Request.

## Licença

Este projeto é licenciado sob a [MIT License](https://opensource.org/licenses/MIT).