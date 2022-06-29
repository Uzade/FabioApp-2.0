import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";


const newPrimitive = async (req: Request, res: Response, db: PrismaClient) =>{
    console.log(req.body)
    const newPrimitive = await db.primitiveDevice.create({
        data:{
            name: req.body.name,
            codeExists: req.body.codeExists,
            groupID: req.body.groupID
        },
    });
    res.status(201).json({data: newPrimitive})
}

export default newPrimitive