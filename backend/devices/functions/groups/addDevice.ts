import { PrismaClient } from "@prisma/client"
import { Request, Response } from "express"

const addDevice = async (req: Request, res: Response, db: PrismaClient) =>{
    const group = await db.deviceGroup.update({
        where: {
            id: parseInt(req.body.groupID),
        },
        data: {
            devices: {
                connect:{
                    id: parseInt(req.body.deviceID)
                }
            }
        },
        include: {
            devices: true
        }
    })

    res.status(201).json({data: group})
}

export default addDevice