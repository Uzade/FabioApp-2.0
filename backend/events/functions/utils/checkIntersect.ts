import { PrismaClient } from "@prisma/client";
import { Response } from "express";

const checkIntersect = async (res: Response, groupID: number, eventID: number,  db: PrismaClient) =>{
    const eventDate = await db.event.findUnique({
        where:{
            id: eventID
        },
        select: {
            startDate: true,
            endDate: true,
        }
    })
    
    const connectedEvents = await db.event.findMany({
        where: {
            devices:{
                every:{
                    id: groupID
                }
            }
        },
        select: {
            startDate: true,
            endDate: true
        }
    })

    if(eventDate == null){
        res.status(400).json({status: "error", problem: "no valid eventID specified"})
        return true
    }
    let returnValue = false;
    for(let event of connectedEvents){
        if(eventDate!.startDate>=event.startDate && eventDate!.startDate<=event.endDate){
            res.status(400).json({status: "error", problem: "events intersect"})
            returnValue = true;
            break
        }
        else if(eventDate!.endDate>=event.startDate && eventDate!.endDate<=event.endDate){
            res.status(400).json({status: "error", problem: "events intersect"})
            returnValue = true;
            break
        }
        else if(event.startDate>= eventDate!.startDate && event.startDate<=eventDate!.endDate){
            res.status(400).json({status: "error", problem: "events intersect"})
            returnValue = true;
            break
        }
        else if(event.endDate>= eventDate!.startDate && event.endDate<=eventDate!.endDate){
            res.status(400).json({status: "error", problem: "events intersect"})
            returnValue = true;
            break
        }
    }
    return returnValue
}

export default checkIntersect