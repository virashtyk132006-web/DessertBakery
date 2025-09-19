const express = require('express');
const sql = require('mssql');
const app = express();
const PORT = 3000;

// Параметри для Windows Authentication
const dbConfig = {
  server: 'DESKTOP-ABC123\\SQLEXPRESS', // або ім’я інстансу, напр. 'localhost\\SQLEXPRESS'
  database: 'DessertBakery',
  options: {
    encrypt: false,             // false простіше для локальної розробки
    trustServerCertificate: true
  }
  // Головне: відсутні user/password
};

app.get('/products', async (req, res) => {
  try {
    const pool = await sql.connect(dbConfig);
    const result = await pool.request().query('SELECT * FROM Products');
    res.json(result.recordset);
  } catch (err) {
    console.error('DB error:', err);
    res.status(500).send('Database error');
  }
});

app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));
