import { PrismaClient } from "@prisma/client";
import { Request, Response } from 'express-serve-static-core';

const getUnique = async (req:Request, res: Response, prisma: PrismaClient) => {
    console.log ('bröm'+req.query.userId)
    const UniqueUsers = await prisma.user.findUnique({
        where:{ 
            id: parseInt( "" +req.query.userId )
        },
        select: {
            id: true,
            UID: true,
            email: true,
            permitionID: true,
        }
    })

    res.status(200).json({
        data: UniqueUsers
    })
}

export default getUnique