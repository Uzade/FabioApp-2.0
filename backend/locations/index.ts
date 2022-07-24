import { Express } from "express-serve-static-core";
import { PrismaClient } from "@prisma/client";
import newLocation from "./functions/newLocation";


const locations = (app: Express, db: PrismaClient) => {

    app.post('/location/new', (req, res) => {
        newLocation(req, res, db)
    })
}

export default locations