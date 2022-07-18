import { PrismaClient } from "@prisma/client";
import { Request, Response } from 'express-serve-static-core';

const getAllGroups = async (req:Request, res: Response, prisma: PrismaClient) => {
    const allGroups = await prisma.deviceGroup.findMany({
        select: {
            id   :true,                  
            name  :true,             
            location: true,
            devices: {
                select:{
                    id: true,
                    name: true,
                    company:true,
                    category: true,
                    subcategory: true,
                    Creator: true,
                    price: true,
                    codeExists: true
                }
            },
            primitiveDevice: true
        }
    })

    res.status(200).json({
        data: allGroups
    })
}

export default getAllGroups