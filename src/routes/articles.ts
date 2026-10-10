import { Router } from "express";
import { pool } from "../database.js";
import { Article } from "../interfaces.js";
import { authenticateToken } from "../middleware/auth-validation.js";
import type { ResultSetHeader } from "mysql2";

const router = Router();

router.get("/", async (req, res) => {
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

router.post("/", authenticateToken, async (req, res) => {
  try {
    const { title, body, category } = req.body;

    if (!title || !body || !category) {
      return res.status(400).json({
        error: "Title, body, and category are required",
      });
    }

    const userId = req.user?.id;

    if (userId === undefined) {
      return res.status(401).json({
        error: "Authentication required",
      });
    }

    const [result] = await pool.execute<ResultSetHeader>(
      "INSERT INTO articles (title, body, category, submitted_by) VALUES (?, ?, ?, ?)",
      [title, body, category, userId],
    );

    res.status(201).json({
      message: "Article created successfully",
      id: result.insertId,
    });
  } catch (error) {
    console.error("Article creation error:", error);

    res.status(500).json({
      error: "Failed to post article",
    });
  }
});

export default router;
