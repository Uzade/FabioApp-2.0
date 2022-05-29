import { PrismaClient } from "@prisma/client";
import { Request, Response } from 'express-serve-static-core';

const getAll = async (req:Request, res: Response, prisma: PrismaClient) => {
    const allUsers = await prisma.user.findMany({
        select: {
            id: true,
            UID: true,
            email: true,
            permitionID: true,
        }
    })

    res.status(200).json({
        data: allUsers
    })
}

export default getAll