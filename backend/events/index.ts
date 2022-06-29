//import types
import { Express } from "express-serve-static-core";
import { PrismaClient } from "@prisma/client";

import getAll from "./functions/getAll"
import newEvent from "./functions/newEvent";
import getUnique from "./functions/getUnique";
import addDeviceGroup from "./functions/addDeviceGroup";

function events(app: Express, db: PrismaClient){

    app.get('/events/all', (req, res) =>{
        getAll(req, res, db)
    })

    app.get('/events/unique', (req, res) =>{
        getUnique(req, res, db)
    })

    app.post('/events/new', (req, res) =>{
        newEvent(req, res, db)
    })

    app.patch('/events/addDevice', (req, res) =>{
        addDeviceGroup(req, res, db)
    })

}

export default events