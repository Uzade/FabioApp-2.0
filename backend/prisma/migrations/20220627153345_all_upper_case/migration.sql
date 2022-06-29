/*
  Warnings:

  - You are about to drop the `category` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `deviceGroup` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `deviceTest` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `devices` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `event` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `eventDevices` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `offer` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `primitiveDevice` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `subcategory` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "category";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "deviceGroup";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "deviceTest";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "devices";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "event";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "eventDevices";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "offer";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "primitiveDevice";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "subcategory";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "DeviceTest" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "deviceID" INTEGER NOT NULL,
    "date" DATETIME NOT NULL,
    "category1" BOOLEAN NOT NULL,
    "category2" BOOLEAN NOT NULL,
    CONSTRAINT "DeviceTest_deviceID_fkey" FOREIGN KEY ("deviceID") REFERENCES "Devices" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Category" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Subcategory" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "PrimitiveDevice" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "groupID" INTEGER NOT NULL,
    "codeExists" BOOLEAN NOT NULL,
    CONSTRAINT "PrimitiveDevice_groupID_fkey" FOREIGN KEY ("groupID") REFERENCES "DeviceGroup" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Devices" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "company" TEXT NOT NULL,
    "categoryID" INTEGER NOT NULL,
    "subcategoryID" INTEGER NOT NULL,
    "creatorID" INTEGER NOT NULL,
    "price" INTEGER NOT NULL,
    "codeExists" BOOLEAN NOT NULL,
    "groupID" INTEGER NOT NULL,
    CONSTRAINT "Devices_creatorID_fkey" FOREIGN KEY ("creatorID") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Devices_categoryID_fkey" FOREIGN KEY ("categoryID") REFERENCES "Category" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Devices_subcategoryID_fkey" FOREIGN KEY ("subcategoryID") REFERENCES "Subcategory" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Devices_groupID_fkey" FOREIGN KEY ("groupID") REFERENCES "DeviceGroup" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Event" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "creatorID" INTEGER NOT NULL,
    "customerID" INTEGER NOT NULL,
    "locationID" INTEGER NOT NULL,
    "dateTime" DATETIME NOT NULL,
    "offerID" INTEGER NOT NULL,
    CONSTRAINT "Event_customerID_fkey" FOREIGN KEY ("customerID") REFERENCES "Customer" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Event_locationID_fkey" FOREIGN KEY ("locationID") REFERENCES "Location" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Event_offerID_fkey" FOREIGN KEY ("offerID") REFERENCES "Offer" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "DeviceGroup" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "locationID" INTEGER NOT NULL,
    CONSTRAINT "DeviceGroup_locationID_fkey" FOREIGN KEY ("locationID") REFERENCES "Location" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Offer" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "price" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "EventDevices" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "eventID" INTEGER NOT NULL,
    "deviceID" INTEGER NOT NULL,
    "isThere" BOOLEAN NOT NULL,
    CONSTRAINT "EventDevices_eventID_fkey" FOREIGN KEY ("eventID") REFERENCES "Event" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "EventDevices_deviceID_fkey" FOREIGN KEY ("deviceID") REFERENCES "DeviceGroup" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "DeviceTest_deviceID_key" ON "DeviceTest"("deviceID");

-- CreateIndex
CREATE UNIQUE INDEX "PrimitiveDevice_groupID_key" ON "PrimitiveDevice"("groupID");

-- CreateIndex
CREATE UNIQUE INDEX "Devices_categoryID_key" ON "Devices"("categoryID");

-- CreateIndex
CREATE UNIQUE INDEX "Devices_subcategoryID_key" ON "Devices"("subcategoryID");

-- CreateIndex
CREATE UNIQUE INDEX "Devices_creatorID_key" ON "Devices"("creatorID");

-- CreateIndex
CREATE UNIQUE INDEX "Devices_groupID_key" ON "Devices"("groupID");

-- CreateIndex
CREATE UNIQUE INDEX "Event_creatorID_key" ON "Event"("creatorID");

-- CreateIndex
CREATE UNIQUE INDEX "Event_customerID_key" ON "Event"("customerID");

-- CreateIndex
CREATE UNIQUE INDEX "Event_locationID_key" ON "Event"("locationID");

-- CreateIndex
CREATE UNIQUE INDEX "Event_offerID_key" ON "Event"("offerID");

-- CreateIndex
CREATE UNIQUE INDEX "DeviceGroup_locationID_key" ON "DeviceGroup"("locationID");

-- CreateIndex
CREATE UNIQUE INDEX "EventDevices_eventID_key" ON "EventDevices"("eventID");

-- CreateIndex
CREATE UNIQUE INDEX "EventDevices_deviceID_key" ON "EventDevices"("deviceID");
