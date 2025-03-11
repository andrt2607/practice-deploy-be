require('dotenv').config()
const express = require('express')
const userRoutes = require('./routes/userRoutes')

const app = express()
const port = 3000

app.use('/users', userRoutes)

app.get('/', (req, res) => {
  res.send('Hello World! already updated to remote host')
})

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`)
})
