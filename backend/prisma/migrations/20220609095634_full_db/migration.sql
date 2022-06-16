-- CreateTable
CREATE TABLE "deviceTest" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "deviceID" INTEGER NOT NULL,
    "date" DATETIME NOT NULL,
    "category1" BOOLEAN NOT NULL,
    "category2" BOOLEAN NOT NULL,
    CONSTRAINT "deviceTest_deviceID_fkey" FOREIGN KEY ("deviceID") REFERENCES "devices" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Customer" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "company" TEXT,
    "streetNum" TEXT NOT NULL,
    "city" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Location" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "isEvent" BOOLEAN NOT NULL,
    "isStorage" BOOLEAN NOT NULL,
    "name" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "city" TEXT NOT NULL,
    "details" TEXT
);

-- CreateTable
CREATE TABLE "category" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "subcategory" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "primitiveDevice" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "groupID" INTEGER NOT NULL,
    "codeExists" BOOLEAN NOT NULL,
    CONSTRAINT "primitiveDevice_groupID_fkey" FOREIGN KEY ("groupID") REFERENCES "deviceGroup" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "devices" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "company" TEXT NOT NULL,
    "categoryID" INTEGER NOT NULL,
    "subcategoryID" INTEGER NOT NULL,
    "creatorID" INTEGER NOT NULL,
    "price" INTEGER NOT NULL,
    "codeExists" BOOLEAN NOT NULL,
    "groupID" INTEGER NOT NULL,
    CONSTRAINT "devices_creatorID_fkey" FOREIGN KEY ("creatorID") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "devices_categoryID_fkey" FOREIGN KEY ("categoryID") REFERENCES "category" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "devices_subcategoryID_fkey" FOREIGN KEY ("subcategoryID") REFERENCES "subcategory" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "devices_groupID_fkey" FOREIGN KEY ("groupID") REFERENCES "deviceGroup" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "event" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "creatorID" INTEGER NOT NULL,
    "customerID" INTEGER NOT NULL,
    "locationID" INTEGER NOT NULL,
    "dateTime" DATETIME NOT NULL,
    "offerID" INTEGER NOT NULL,
    CONSTRAINT "event_customerID_fkey" FOREIGN KEY ("customerID") REFERENCES "Customer" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "event_locationID_fkey" FOREIGN KEY ("locationID") REFERENCES "Location" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "event_offerID_fkey" FOREIGN KEY ("offerID") REFERENCES "offer" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "deviceGroup" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "locationID" INTEGER NOT NULL,
    CONSTRAINT "deviceGroup_locationID_fkey" FOREIGN KEY ("locationID") REFERENCES "Location" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "offer" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "price" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "eventDevices" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "eventID" INTEGER NOT NULL,
    "deviceID" INTEGER NOT NULL,
    "isThere" BOOLEAN NOT NULL,
    CONSTRAINT "eventDevices_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES "event" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "eventDevices_deviceID_fkey" FOREIGN KEY ("deviceID") REFERENCES "deviceGroup" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "deviceTest_deviceID_key" ON "deviceTest"("deviceID");

-- CreateIndex
CREATE UNIQUE INDEX "primitiveDevice_groupID_key" ON "primitiveDevice"("groupID");

-- CreateIndex
CREATE UNIQUE INDEX "devices_categoryID_key" ON "devices"("categoryID");

-- CreateIndex
CREATE UNIQUE INDEX "devices_subcategoryID_key" ON "devices"("subcategoryID");

-- CreateIndex
CREATE UNIQUE INDEX "devices_creatorID_key" ON "devices"("creatorID");

-- CreateIndex
CREATE UNIQUE INDEX "devices_groupID_key" ON "devices"("groupID");

-- CreateIndex
CREATE UNIQUE INDEX "event_creatorID_key" ON "event"("creatorID");

-- CreateIndex
CREATE UNIQUE INDEX "event_customerID_key" ON "event"("customerID");

-- CreateIndex
CREATE UNIQUE INDEX "event_locationID_key" ON "event"("locationID");

-- CreateIndex
CREATE UNIQUE INDEX "event_offerID_key" ON "event"("offerID");

-- CreateIndex
CREATE UNIQUE INDEX "deviceGroup_locationID_key" ON "deviceGroup"("locationID");

-- CreateIndex
CREATE UNIQUE INDEX "eventDevices_eventID_key" ON "eventDevices"("eventID");

-- CreateIndex
CREATE UNIQUE INDEX "eventDevices_deviceID_key" ON "eventDevices"("deviceID");
