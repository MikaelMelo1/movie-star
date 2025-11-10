# 🎬 MovieStar

Sistema web de avaliação e catalogação de filmes desenvolvido em PHP. Permite que usuários cadastrem filmes, façam avaliações e compartilhem suas opiniões sobre produções cinematográficas.

## 📋 Índice

- [Funcionalidades](#-funcionalidades)
- [Tecnologias Utilizadas](#-tecnologias-utilizadas)
- [Requisitos](#-requisitos)
- [Instalação](#-instalação)
- [Configuração](#-configuração)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Uso](#-uso)
- [Funcionalidades Detalhadas](#-funcionalidades-detalhadas)

## ✨ Funcionalidades

- 🔐 **Sistema de Autenticação**: Login e registro de usuários
- 🎥 **CRUD de Filmes**: Cadastro, edição, visualização e exclusão de filmes
- ⭐ **Sistema de Avaliações**: Usuários podem avaliar filmes com notas e comentários
- 🔍 **Busca de Filmes**: Pesquisa por título
- 📂 **Categorização**: Filmes organizados por categorias (Ação, Terror, Comédia, etc.)
- 👤 **Perfis de Usuário**: Perfis personalizáveis com foto e biografia
- 📊 **Dashboard**: Painel administrativo para gerenciar filmes cadastrados
- 🖼️ **Upload de Imagens**: Sistema de upload para capas de filmes e fotos de perfil

## 🛠️ Tecnologias Utilizadas

- **PHP** - Linguagem de programação backend
- **MySQL** - Banco de dados relacional
- **PDO** - Interface de acesso ao banco de dados
- **HTML/CSS** - Estrutura e estilização
- **Bootstrap** - Framework CSS (inferido pelo uso de classes)
- **Font Awesome** - Ícones (inferido pelo uso de classes)

## 📦 Requisitos

- PHP 7.4 ou superior
- MySQL 5.7 ou superior
- Servidor web (Apache/Nginx) ou XAMPP/WAMP
- Extensão PDO habilitada no PHP

## 🚀 Instalação

1. **Clone o repositório ou baixe os arquivos**
   ```bash
   git clone https://github.com/MikaelMelo1/movie-star
   cd movie-star
   ```

2. **Configure o servidor web**
   - Se estiver usando XAMPP, copie a pasta para `C:\xampp\htdocs\movie-star`
   - Se estiver usando WAMP, copie para `C:\wamp64\www\movie-star`
   - Para outros servidores, configure o diretório raiz apontando para a pasta do projeto

3. **Crie o banco de dados**
   - Acesse o phpMyAdmin ou MySQL via linha de comando
   - Crie um banco de dados chamado `moviestar`
   - Importe o arquivo SQL movies.sql ou crie as tabelas manualmente

## ⚙️ Configuração

1. **Configure a conexão com o banco de dados**

   Edite o arquivo `db.php` com suas credenciais:

   ```php
   $db_name = "moviestar";
   $db_host = "localhost";
   $db_user = "seu_usuario";
   $db_pass = "sua_senha";
   ```

2. **Verifique as permissões de diretório**

   Certifique-se de que a pasta `img/` e suas subpastas (`movies/` e `users/`) tenham permissões de escrita para upload de imagens.

3. **Ajuste a URL base (se necessário)**

   O arquivo `globals.php` configura automaticamente a URL base. Se necessário, ajuste manualmente.

## 📁 Estrutura do Projeto

```
movie-star/
│
├── auth.php                 # Página de login e registro
├── auth_process.php         # Processamento de autenticação
├── index.php                # Página inicial
├── dashboard.php            # Painel do usuário
├── movie.php                # Página de detalhes do filme
├── newmovie.php             # Formulário de novo filme
├── editmovie.php            # Formulário de edição de filme
├── movie_process.php        # Processamento de operações de filmes
├── profile.php              # Página de perfil do usuário
├── editprofile.php          # Edição de perfil
├── user_process.php         # Processamento de operações de usuário
├── review_process.php       # Processamento de avaliações
├── search.php               # Página de busca
├── logout.php               # Logout do usuário
├── db.php                   # Configuração do banco de dados
├── globals.php              # Configurações globais
│
├── models/                  # Modelos de dados
│   ├── User.php
│   ├── Movie.php
│   ├── Review.php
│   └── Message.php
│
├── dao/                     # Data Access Objects
│   ├── UserDAO.php
│   ├── MovieDAO.php
│   └── ReviewDAO.php
│
├── templates/               # Templates reutilizáveis
│   ├── header.php
│   ├── footer.php
│   ├── movie_card.php
│   └── user_review.php
│
├── css/                     # Estilos
│   └── styles.css
│
└── img/                     # Imagens
    ├── logo.svg
    ├── movies/              # Capas de filmes
    └── users/               # Fotos de perfil
```

## 💻 Uso

1. **Acesse o sistema**
   - Abra seu navegador e acesse: `http://localhost/movie-star`

2. **Crie uma conta**
   - Clique em "Entrar" no menu
   - Preencha o formulário de registro com seus dados

3. **Faça login**
   - Use suas credenciais para acessar o sistema

4. **Adicione filmes**
   - Acesse o Dashboard
   - Clique em "Adicionar Filme"
   - Preencha as informações do filme (título, descrição, categoria, trailer, etc.)
   - Faça upload da capa do filme

5. **Avalie filmes**
   - Navegue até a página de um filme
   - Deixe sua avaliação com nota e comentário

6. **Busque filmes**
   - Use a barra de busca no topo da página para encontrar filmes por título

## 🎯 Funcionalidades Detalhadas

### Sistema de Usuários
- Registro com validação de email
- Login com autenticação segura (hash de senha)
- Perfil personalizável com foto e biografia
- Edição de perfil
- Sistema de tokens para sessões

### Sistema de Filmes
- Cadastro completo de filmes (título, descrição, categoria, duração, trailer)
- Upload de capas de filmes
- Edição e exclusão de filmes
- Visualização por categoria
- Filmes mais recentes na homepage
- Busca por título

### Sistema de Avaliações
- Avaliação com nota (rating)
- Comentários sobre os filmes
- Visualização de todas as avaliações de um filme
- Cálculo de média de notas
- Prevenção de avaliações duplicadas

### Interface
- Design responsivo
- Navegação intuitiva
- Cards de filmes com informações resumidas
- Páginas de detalhes completas

## 🔒 Segurança

- Senhas são armazenadas com hash usando `password_hash()`
- Tokens de sessão para autenticação
- Validação de dados de entrada
- Proteção contra SQL Injection usando PDO prepared statements

## 📝 Notas

- Certifique-se de configurar corretamente as credenciais do banco de dados
- As imagens são armazenadas na pasta `img/` com nomes gerados aleatoriamente
- O sistema utiliza sessões PHP para manter o usuário logado

