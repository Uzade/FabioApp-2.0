import { PrismaClient } from "@prisma/client"
import { Request, Response } from "express"

const addPrimitive = async (req: Request, res: Response, db: PrismaClient) =>{
    const group = await db.deviceGroup.update({
        where: {
            id: parseInt(req.body.groupID),
        },
        data: {
            primitiveDevice: {
                connect:{
                    id: parseInt(req.body.primitiveID)
                }
            }
        },
        include: {
            primitiveDevice: true
        }
    })

    res.status(201).json({data: group})
}

export default addPrimitive