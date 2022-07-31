import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";


const newEvent = async (req: Request, res: Response, db: PrismaClient) =>{
    const startDate = new Date(req.body.startDate)
    const endDate = new Date(req.body.endDate)
    const newEvent = await db.event.create({
        data:{
            creatorID: req.body.creatorID,
            customer:{
                connectOrCreate:{
                    where: {
                        id: req.body.customerID
                    },
                    create:{
                        name: req.body.customerName,
                        streetNum: req.body.customerStreetNum,
                        city: req.body.customerCity
                    }
                }
            },
            location: {
                connectOrCreate: {
                    where: {
                        adress: req.body.adress
                    },
                    create: {
                        isEvent: true,
                        isStorage: false,
                        name: req.body.adress,
                        adress: req.body.adress
                    }
                }
            },
            startDate: startDate,
            endDate: endDate,
            name: req.body.name
        },
        include:{
            customer: true,
            location: true,
            offer: true,
        }
    });
    res.status(201).json({created: newEvent})
}

export default newEvent