import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";

const checkLogin = async (req: Request, res: Response, db: PrismaClient) => {

    const PasswordDB = await db.user.findUnique({
        select: {
            password: true,
        },
        where: {
            UID: req.body.UID,
        }
    });

    const passwordInp = req.body.password

    if(PasswordDB?.password == passwordInp){
        const apiKey = Math.floor(Math.random() * 10000000000);
        await db.user.update({
            data:{
                apiKey: "" + apiKey,
            },
            where: {
                UID: req.body.UID
            },
        })
        res.status(200).json({message: "Password korrekt", apiKey: apiKey})
    }
    else{
        res.status(401).json({message: "Password nicht korrekt"})
    }
  
}
export default checkLogin