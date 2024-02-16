const express = require('express');
const app = express();

// Rute untuk endpoint root
app.get('/', (req, res) => {
  res.send('Hello, World!');
});

// Rute lainnya...

// Mulai server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server berjalan di port ${PORT}`);
});
