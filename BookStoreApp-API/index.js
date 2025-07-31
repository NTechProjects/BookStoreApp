const express = require('express')
const app = express()
const userRouter = require('./routes/users')

app.use(express.json())

app.use('/users', userRouter)

const port = 4000
app.listen(port, '0.0.0.0', () => {
    console.log('server ready at port', port)
})

