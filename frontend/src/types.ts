
export interface CalendarEvent {
    id?: string | number
    resourceIds?: string[] | number[]
    allDay?: boolean
    start: Date | string
    end: Date | string
    title: string
    editable?: boolean
    startEditable?: boolean
    durationEditable?: boolean
    display?: string
    backgroundColor?: string
    extendedProps?: any

}

export interface Lable {
    id: number
    groupName: string
    devices: Device[]
}

export interface Device {
    Creator: Creator
    category: Category
    codeExists: boolean
    company: string
    id: number
    name: string
    price: number
    subcategory: Subcategory
}

export interface Category {
    id: number
    name: string
}

export interface Subcategory {
    id: number
    name: string
}

export interface Creator{
    UID: string
    apiKey: string
    email: string
    id: number
    password?: string
    permitionID: number
}