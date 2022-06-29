import { PrismaClient } from "@prisma/client";
import { Request, Response } from 'express-serve-static-core';

const getAllGroups = async (req:Request, res: Response, prisma: PrismaClient) => {
    const allGroups = await prisma.deviceGroup.findMany({
        select: {
            id   :true,                  
            name  :true,             
            location: true,
            devices: true,
            primitiveDevice: true
        }
    })

    res.status(200).json({
        data: allGroups
    })
}

export default getAllGroups