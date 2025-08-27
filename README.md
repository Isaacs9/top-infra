# TOP – Plataforma Completa (Infraestrutura)

Este repositório (`top-infra`) contém a **infraestrutura centralizada** para executar todos os serviços do ecossistema **TOP**, incluindo backends (microserviços), frontends (microfrontends + shell), e banco de dados.

---

## 📦 Estrutura de Projetos

Todos os projetos devem estar **no mesmo nível de diretório**, como no exemplo:

```
/meus-projetos/
  ├── top-infra
  ├── top-users
  ├── top-finances
  ├── top-api-gateway
  ├── top-frontend
  ├── mf-top-users
  └── mf-top-finance
```

---

## 🧩 Serviços que compõem a stack

| Serviço             | Porta Local | Descrição                                |
|---------------------|-------------|------------------------------------------|
| 🗄️ PostgreSQL       | 5432        | Banco de dados relacional                |
| 👥 top-users         | 3001        | Microserviço de usuários                 |
| 💰 top-finances      | 3002        | Microserviço de finanças                 |
| 🌐 top-api-gateway   | 3000        | Gateway central que orquestra os serviços |
| 🖥️ top-frontend      | 5173        | Frontend principal (shell)               |
| 🧩 mf-top-users      | 5174        | Microfrontend de usuários                |
| 🧩 mf-top-finance    | 5175        | Microfrontend de finanças                |

---

## ⚙️ Pré-requisitos

- [Docker](https://www.docker.com/) versão **20.10+**
- [Docker Compose](https://docs.docker.com/compose/) versão **1.29+**
- Git (para clonar os repositórios)
- Node.js (opcional para desenvolvimento individual)

---

## ▶️ Como rodar tudo com Docker

1. **Clone todos os repositórios** no mesmo diretório conforme a estrutura acima.
2. **Acesse o diretório `top-infra`:**

```bash
cd top-infra
```

3. **Suba todos os serviços com:**

```bash
docker-compose up --build
```

> A flag `--build` garante que as imagens sejam reconstruídas se houve alterações.

---

## 🌍 Acesso aos serviços

Após o `docker-compose up`, você poderá acessar:

| Serviço                | URL                                                       |
|------------------------|-----------------------------------------------------------|
| API Gateway            | http://localhost:3000                                     |
| top-users              | tcp:3001                                                  |
| top-finances           | tcp:3002                                                  |
| Frontend Shell         | http://localhost:5173                                     |
| MF – Users             | http://localhost:5174                                     |
| MF – Finance           | http://localhost:5175                                     |
| Banco de Dados (pg)    | `localhost:5432` (user: `topadmin`, pass: `toppass`, db: `topdb`) |

---

## 🛠️ Desenvolvimento Local (modo individual)

Se você quiser rodar **um serviço isolado**, pode fazer isso fora do Docker:

### Exemplo: rodando `top-users` localmente

```bash
cd top-users
npm install
npm run start:dev
```

⚠️ Certifique-se de que **o banco de dados PostgreSQL está rodando via Docker** (você pode subir só ele com `docker-compose up postgres`).

⚠️ Cada aplicação tem seu próprio usuário e banco de dados, pode ser conferido no README de cada uma delas. 

---

## 🧹 Comandos úteis

### Subir tudo
```bash
docker-compose up --build
```

### Subir em background
```bash
docker-compose up -d
```

### Parar tudo
```bash
docker-compose down
```

### Ver logs
```bash
docker-compose logs -f
```

---

## 📁 Volumes e persistência

Os dados do PostgreSQL são persistidos no volume `postgres_data`.  
Para apagar completamente os dados (⚠️ destrutivo):

```bash
docker-compose down -v
```

---

## 🧪 Dicas para ambiente de testes

- Use `NODE_ENV=development` nos microserviços para permitir `hot reload`.
- Configure `.env` em cada projeto (`top-users`, `top-finances`, etc.).

---

## 👨‍💻 Autores

- **Isaac Pereira** – arquitetura e desenvolvimento

---

## 📜 Licença

Este projeto está licenciado sob os termos da licença MIT.
