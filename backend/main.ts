import express from 'express'
import cors from 'cors'
import { PrismaClient } from '@prisma/client'

import users from './users/index'
import devices from './devices/index'
import events from './events/index'
import locations from './locations'

const app = express() 
const PORT = 8080
const prisma = new PrismaClient()


app.use(cors({
    origin: "*",
}))

app.use(express.json())
 
users(app, prisma)
devices(app, prisma)
events(app, prisma)
locations(app, prisma)

app.listen(PORT, () => {console.log(`server live on http://localhost:${PORT}`)})