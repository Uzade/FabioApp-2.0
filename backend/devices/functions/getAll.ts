import { PrismaClient } from "@prisma/client";
import { Request, Response } from 'express-serve-static-core';

const getAll = async (req:Request, res: Response, prisma: PrismaClient) => {
    const allDevices = await prisma.devices.findMany({
        select: {
            id   :true,                  
            name  :true,             
            company  :true,       
            category  :true,          
            subcategory :true,   
            Creator  :true,           
            price  :true,   
            codeExists :true,   
            deviceGroup : {
                select: {
                    id: true,
                    location: true,
                    
                }
            }  
        }
    })

    res.status(200).json({
        data: allDevices
    })
}

export default getAll