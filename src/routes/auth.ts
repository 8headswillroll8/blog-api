import "dotenv/config";
import { Router } from "express";
import bcrypt from "bcrypt";
import { ResultSetHeader } from "mysql2";
import { pool } from "../database.js";
import {
  validateRegistration,
  validateLogin,
} from "../middleware/auth-validation.js";
import { User, UserResponse } from "../interfaces.js";
import { generateToken } from "../utils/jwt.js";

const router = Router();

router.post("/register", validateRegistration, async (req, res) => {
  try {
    const { email, password } = req.body;

    // check if user already exists
    const [rows] = await pool.execute("select * from users where email = ?", [
      email,
    ]);

    const existingUsers = rows as User[];

    if (existingUsers.length > 0) {
      return res.status(400).json({
        error: "User with this email already exists",
      });
    }

    const saltRounds = 10;
    const hashPassword = await bcrypt.hash(password, saltRounds);

    const [result] = await pool.execute<ResultSetHeader>(
      "insert into users (email, password_hash) values (?, ?)",
      [email, hashPassword],
    );

    const userResponse: UserResponse = {
      id: result.insertId,
      email,
    };

    res.status(201).json({
      message: "User registered",
      user: userResponse,
    });
  } catch (error) {
    console.error("Registration error:", error);
    res.status(500).json({
      error: "Failed to register user",
    });
  }
});

router.post("/login", validateLogin, async (req, res) => {
  try {
    const { email, password } = req.body;

    const [rows] = await pool.execute("SELECT * FROM users WHERE email = ?", [
      email,
    ]);

    const users = rows as User[];

    if (users.length === 0) {
      return res.status(401).json({
        error: "invalid email or password",
      });
    }

    const user = users[0];

    const validPassword = await bcrypt.compare(password, user.password_hash!);

    if (!validPassword) {
      return res.status(401).json({
        error: "invalid email or password",
      });
    }

    const token = generateToken(user.id);

    const userResponse: UserResponse = {
      id: user.id,
      email: user.email,
    };

    res.json({
      message: "Login Successful",
      user: userResponse,
      token,
    });
  } catch (error) {
    console.error("Login error:", error);
    res.status(500).json({
      error: "Failed to log in",
    });
  }
});

export default router;
