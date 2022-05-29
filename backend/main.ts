import express from 'express'
import cors from 'cors'

const app = express()
const PORT = 8080


app.use(cors({
    origin: "*",
}))

app.use(express.json())



app.listen(PORT, () => {console.log(`server live on http://localhost:${PORT}`)})