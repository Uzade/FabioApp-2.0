import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";


const newDevice = async (req: Request, res: Response, db: PrismaClient) =>{
    console.log(req.body)
    const newDevice = await db.devices.create({
        data:{
            name: req.body.name,
            company: req.body.company,
            categoryID: req.body.categoryID,
            subcategoryID: req.body.subcategoryID,
            creatorID: req.body.creatorID,
            price: req.body.price,
            codeExists: req.body.codeExists,
            groupID: req.body.groupID
        },
    });
    res.status(201).json(newDevice)
}

export default newDevice