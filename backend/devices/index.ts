import { Express } from "express-serve-static-core";
import { PrismaClient } from "@prisma/client";
import newDevice from "./functions/newDevice";
import getAll from "./functions/getAll";
import newPrimitive from "./functions/newPrimitive";
import getAllPrimitives from "./getAllPrimitives";
import newGroup from "./functions/groups/newGroup";
import getAllGroups from "./functions/groups/getAllGroups";
import addDevice from "./functions/groups/addDevice";
import addPrimitive from "./functions/groups/addPrimitive";

function devices(app: Express, db: PrismaClient) {
    app.post('/device/new', (req, res) =>{
        newDevice(req, res, db)

    })

    app.get('/device/all', (req, res) =>{
        getAll(req, res, db)
    })

    app.post('/device/newPrimitive', (req, res) =>{
        newPrimitive(req, res, db)
    })

    app.get('/device/allPrimitives', (req, res) =>{
        getAllPrimitives(req, res, db)
    })

    app.post('/device/groups/new', (req, res) =>{
        newGroup(req, res, db)
    })

    app.get('/device/groups/all', (req, res) =>{
        getAllGroups(req, res, db)
    })

    app.patch('/device/groups/addDevice', (req, res) =>{
        addDevice(req, res, db)
    })

    app.patch('/device/groups/addPrimitive', (req, res) =>{
        addPrimitive(req, res, db)
    })
}

export default devices


