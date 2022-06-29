import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";


const newGroup = async (req: Request, res: Response, db: PrismaClient) =>{
    const newGroup = await db.deviceGroup.create({
        data:{
            name: req.body.name,
            locationID: req.body.locationID
        }
    })
    res.status(201).json({data: newGroup})
}

export default newGroup