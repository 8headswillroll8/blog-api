# Blog API

A REST API built with Express.js, TypeScript, and MySQL. The application allows users to register, log in, retrieve articles, and create articles using JWT authentication.

This project was developed as part of the Backend Development coursework at Noroff.

## Technologies

- **Node.js & Express.js** — Server and API routes
- **TypeScript** — Static typing
- **MySQL & mysql2** — Database and SQL queries
- **bcrypt** — Password hashing
- **JSON Web Tokens (JWT)** — Authentication
- **Zod** — Request validation
- **Swagger UI & OpenAPI** — API documentation
- **dotenv** — Environment variable configuration

## Features

- User registration with password validation and hashing
- User login with JWT authentication
- Public endpoint for retrieving articles
- Protected endpoint for creating articles
- Input validation and error handling
- Parameterized SQL queries
- Interactive API documentation

## Installation

### Prerequisites

- Node.js and npm
- MySQL server
- Git

### 1. Clone the repository

```bash
git clone https://github.com/8headswillroll8/blog-api.git
cd blog-api
```

### 2. Install dependencies

```bash
npm install
```

### 3. Configure environment variables

Create a `.env` file in the project root:

```env
PORT=3000
DB_HOST=localhost
DB_USER=your_mysql_username
DB_PASSWORD=your_mysql_password
DB_NAME=blog
JWT_SECRET=your_secure_random_secret
```

Generate a JWT secret using:

```bash
openssl rand -hex 32
```

Replace the placeholder values with your local MySQL credentials and generated JWT secret.

Do not commit your `.env` file to GitHub.

### 4. Set up the database

Import the provided `database.sql` file:

```bash
mysql -u your_mysql_username -p < database.sql
```

Enter your MySQL password when prompted.

The SQL dump automatically creates the `blog` database, its tables, and sample data.

The database contains two tables:

- `users` — Stores user emails, hashed passwords, and registration timestamps.
- `articles` — Stores article content, categories, author references, and creation timestamps.

The `submitted_by` column in the `articles` table references the user who created the article.

**Note:** Importing the SQL dump into an existing `blog` database will replace its `users` and `articles` tables. Use it for initial setup.

### 5. Start the development server

```bash
npm run dev
```

The server runs at:

http://localhost:3000

The default port is `3000` unless overridden in `.env`.

## API Endpoints

| Method | Endpoint         | Authentication | Description              |
| ------ | ---------------- | -------------- | ------------------------ |
| POST   | `/auth/register` | No             | Register a new user      |
| POST   | `/auth/login`    | No             | Log in and receive a JWT |
| GET    | `/articles`      | No             | Retrieve all articles    |
| POST   | `/articles`      | Yes            | Create a new article     |

### Authentication

After logging in, include the JWT in the Authorization header when creating an article:

```text
Authorization: Bearer YOUR_JWT_TOKEN
```

Tokens expire after 24 hours.

### Example: Create an Article

**POST** `/articles`

```json
{
  "title": "My First Article",
  "body": "This article was created using the Blog API.",
  "category": "Technology"
}
```

A successful request returns HTTP `201 Created` and the new article ID.

## API Documentation

Interactive API documentation is available through Swagger UI while the server is running:

http://localhost:3000/api-docs

The documentation describes the available endpoints, request bodies, response codes, and JWT authentication.

## Validation and Error Handling

The API validates user registration and login requests using Zod.

Article creation also checks that the title, body, and category are non-empty strings.

The API uses appropriate HTTP status codes, including:

- `200` — Successful request
- `201` — Resource created
- `400` — Invalid input
- `401` — Authentication required or invalid login credentials
- `403` — Invalid or expired access token
- `500` — Server error

## Project Structure

```text
blog-api/
├── src/
│   ├── middleware/
│   │   └── auth-validation.ts
│   ├── routes/
│   │   ├── articles.ts
│   │   └── auth.ts
│   ├── types/
│   │   └── express.d.ts
│   ├── utils/
│   │   └── jwt.ts
│   ├── database.ts
│   ├── index.ts
│   ├── interfaces.ts
│   └── swagger.yaml
├── database.sql
├── package.json
├── tsconfig.json
└── README.md
```

## Testing

The API has been manually tested using Postman, covering successful requests, input validation, authentication failures, and article creation and retrieval.

TypeScript compilation was checked using:

```bash
npx tsc --noEmit
```

## AI Usage Log

**Tool used:** ChatGPT (OpenAI)  
**Period:** October 2026

ChatGPT was used throughout the project as a learning and troubleshooting resource.

| Purpose                     | AI assistance                                                                                                 |
| --------------------------- | ------------------------------------------------------------------------------------------------------------- |
| Project planning            | Discussed the organisation of Express routes, middleware, and database functionality.                         |
| Concept explanations        | Explained TypeScript configuration, Express routing, JWT authentication, bcrypt, SQL queries, and middleware. |
| Debugging                   | Helped interpret error messages and investigate problems with TypeScript, MySQL, and API authentication.      |
| Testing guidance            | Explained how to test API responses, validation, and authentication scenarios using Postman.                  |
| Environment troubleshooting | Helped investigate MySQL version compatibility, Homebrew configuration, and database export issues.           |
| Documentation assistance    | Helped draft and revise the README, Swagger/OpenAPI documentation, and reflection report.                     |

AI suggestions were reviewed against the project's implementation and tested where applicable.

## Author

Lene Johansen

Noroff — Front-End Development
