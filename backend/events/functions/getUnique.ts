import { PrismaClient } from "@prisma/client";
import { Request, Response } from 'express-serve-static-core';

const getUnique = async (req:Request, res: Response, prisma: PrismaClient) => {
    const UniqueEvent = await prisma.event.findUnique({
        where:{ 
            id: parseInt( "" +req.query.eventID )
        },
        select: {
            id: true,
            creatorID: true,
            customer: true,
            devices: true,
            location: true,
            startDate: true,
            endDate: true,
            offer: true
        }
    })

    res.status(200).json({
        data: UniqueEvent
    })
}

export default getUnique