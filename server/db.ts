import 'dotenv/config';
import { createPool } from 'mysql2/promise';
import { drizzle } from 'drizzle-orm/mysql2';
import * as schema from "@shared/schema";


if (!process.env.DATABASE_URL) {
  throw new Error(
    "DATABASE_URL must be set. Did you forget to provision a database?",
  );
}

// Create a MySQL connection pool
export const pool = createPool(process.env.DATABASE_URL);

// Pass the MySQL pool to Drizzle
export const db = drizzle(pool, { schema, mode: 'default' });