import { PrismaClient } from "@prisma/client"
import { Request, Response } from "express"
import checkIntersect from "./utils/checkIntersect"

const addDeviceGroup = async (req: Request, res: Response, db: PrismaClient) =>{
    if(await checkIntersect(res, req.body.deviceGroupID, req.body.eventID, db)){
        return false
    }
    const event = await db.event.update({
        where: {
            id: parseInt(req.body.eventID),
        },
        data: {
            devices: {
                connect:{
                    id: parseInt(req.body.deviceGroupID)
                }
            }
        },
        include: {
            devices: true
        }
    })

    res.status(201).json({data: event})
}

export default addDeviceGroup