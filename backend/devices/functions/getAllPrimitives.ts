import { PrismaClient } from "@prisma/client";
import { Request, Response } from 'express-serve-static-core';

const getAllPrimitives = async (req:Request, res: Response, prisma: PrismaClient) => {
    const allPrimitives = await prisma.primitiveDevice.findMany({
        select: {
            id   :true,                  
            name  :true,
            codeExists :true,   
            deviceGroup :true   
        }
    })

    res.status(200).json({
        data: allPrimitives
    })
}

export default getAllPrimitives