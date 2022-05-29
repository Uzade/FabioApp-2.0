//import types
import { Express } from "express-serve-static-core";
import { PrismaClient } from "@prisma/client";

//import functions
import getAll from './functions/getAll'


function users(app: Express, prisma: PrismaClient){

    app.get('/users/all', (req, res) =>{
        getAll(req, res, prisma)
    })
}

export default users