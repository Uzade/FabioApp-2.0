import { PrismaClient } from "@prisma/client";
import { Request, Response } from 'express-serve-static-core';

const getUniqueGroup = async (req:Request, res: Response, db: PrismaClient) => {
    const uniqueGroup = await db.deviceGroup.findUnique({
        where: {
            id: parseInt( "" +req.query.groupID )
        },
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
        data: uniqueGroup
    })
}

export default getUniqueGroup