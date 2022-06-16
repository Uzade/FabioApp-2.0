//import types
import { Express } from "express-serve-static-core";
import { PrismaClient } from "@prisma/client";

//import functions
import getAll from './functions/getAll'
import getUnique from "./functions/getUnique";


function users(app: Express, prisma: PrismaClient){

    app.get('/users/all', (req, res) =>{
        getAll(req, res, prisma)
    })

    app.get('/users/unique', (req, res) =>{
        getUnique(req, res, prisma)
    })

    app.post('/users/login', (req, res) =>{
        checkLogin(req, res, prisma)

    }) 
}

export default users