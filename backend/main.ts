import express from 'express'
import cors from 'cors'
import { PrismaClient } from '@prisma/client'

import users from './users'


const app = express()
const PORT = 8080
const prisma = new PrismaClient()


app.use(cors({
    origin: "*",
}))

app.use(express.json())

users(app, prisma)

app.listen(PORT, () => {console.log(`server live on http://localhost:${PORT}`)})