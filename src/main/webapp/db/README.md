# Importing `init.sql` and `seed.sql` Using phpMyAdmin

## 📄 Overview

This guide explains how to import the `init.sql` and `seed.sql` files into your MySQL database using **phpMyAdmin**. These files are essential for initializing your database structure and preloading it with sample data.

---

## ⚙️ What Are These Files?

- **`init.sql`**:  
  Contains SQL statements to create your database schema — including tables, relationships, and constraints.

- **`seed.sql`**:  
  Inserts your tables with initial or sample data for development and testing purposes.

---

## 🚀 Steps to Import in phpMyAdmin

1. **Open phpMyAdmin**  
   Log in to [http://localhost/phpmyadmin](http://localhost/phpmyadmin). **Make sure XAMPP is running and connected**.

2. **Create a New Database**  
   - Click on `New` in the sidebar.  
   - Name your database (For this project use, `collegetutorial`) and click **Create**.
>>> You should see the database `collegetutorial` in the list of databases on your left screen.

3. **Import `init.sql`**  
   - Select your newly created database from the sidebar.
   - Go to the **Import** tab.
   - Click **Choose File**, select `init.sql`, and click **Go**.

4. **Import `seed.sql`**  
   - Ensure you're still inside the same database.
   - Go to the **Import** tab again.
   - Click **Choose File**, select `seed.sql`, and click **Go**.

---

## ✅ Why This Is Important

- Ensures **consistent database structure** across all environments.
- Helps **quickly set up** your project for development or testing.
- Allows team members to **start with the same data** and avoid errors.
- Supports **test-driven development (TDD)** by providing sample datasets.

---

## 💡 Tips

- Always import `init.sql` **before** `seed.sql`.
- If you're updating data or structure, re-import both files carefully to avoid conflicts.

