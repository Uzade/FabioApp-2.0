import { Express } from "express-serve-static-core";
import { PrismaClient } from "@prisma/client";
import newDevice from "./functions/newDevice";

const devices = (app: Express, prisma: PrismaClient) =>{
    app.post('/device/new', (req, res) =>{
        newDevice(req, res, prisma)
    })
}

export default devices