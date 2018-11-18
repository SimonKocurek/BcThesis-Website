const express = require('express')
const app = express()
app.use(express.static(__dirname + '/target'))

app.get('/', (request, response) => {
  response.sendFile('index.html')
})

app.get('/bundle.js', (request, response) => {
  response.sendFile('bundle.js')
})

app.use((err, request, response, next) => {
  console.log(err)
  response.status(500).send('Something broke!')
})

app.listen(5402)
