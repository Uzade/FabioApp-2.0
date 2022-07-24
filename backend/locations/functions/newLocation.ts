import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const newLocation = async (req: Request, res: Response, db:PrismaClient) => {
    const location = await db.location.create({
        data: {
            isStorage: req.body.isStorage,
            isEvent: !req.body.isStorage,
            name: req.body.name || req.body.adress,
            adress: req.body.adress,
            details: req.body.details
        }
    })
    res.status(201).json({data: location})
}

export default newLocation