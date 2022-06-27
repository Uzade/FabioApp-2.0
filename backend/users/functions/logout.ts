import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";


const logout = async (req:Request, res:Response, db:PrismaClient) => {
    const User = await db.user.updateMany({
        where: {
            UID: req.params.UID
        },
        data: {
            apiKey: "",
        },
    })

    res.status(201).json(User)
}

export default logout;