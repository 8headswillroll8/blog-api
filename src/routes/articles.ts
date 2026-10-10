import { Router } from "express";
import { pool } from "../database";
import { Article } from "../interfaces";

const router = Router();

// https://learning.noroff.no/mod/book/view.php?id=28165&chapterid=109106#mod_book-chapter

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

export default router;
