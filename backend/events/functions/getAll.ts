import { PrismaClient } from "@prisma/client";
import { Request, Response } from 'express-serve-static-core';

const getAll = async (req:Request, res: Response, prisma: PrismaClient) => {
    const allEvents = await prisma.event.findMany({
        select: {
            id            :true,
            creatorID     :true,
            devices       :true,
            startDate     :true,
            endDate       :true,
            offer         :true,
            offerID       :true
        }
    })

    res.status(200).json({
        data: allEvents
    })
}

export default getAll