import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import { pool } from "./database";

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

interface User {
  id: number;
  email: string;
  password_hash: string;
  created_at: Date;
}

interface Article {
  id: number;
  title: string;
  body: string;
  category: string;
  submitted_by: number;
  created_at: Date;
}

app.get("/users", async (req, res) => {
  try {
    const [rows] = await pool.execute("SELECT * FROM users");
    const users = rows as User[];

    res.json(users);
  } catch (error) {
    console.error("Database query error:", error);

    res.status(500).json({
      error: "Failed to fetch users",
    });
  }
});

app.get("/articles", async (req, res) => {
  try {
    const [rows] = await pool.execute("SELECT * FROM articles");
    const articles = rows as Article[];

    res.json(articles);
  } catch (error) {
    console.error("Database query error:", error);

    res.status(500).json({
      error: "Failed to fetch articles",
    });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
