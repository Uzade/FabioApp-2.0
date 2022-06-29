/*
  Warnings:

  - You are about to drop the `EventDevices` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `dateTime` on the `Event` table. All the data in the column will be lost.
  - Added the required column `endDate` to the `Event` table without a default value. This is not possible if the table is not empty.
  - Added the required column `startDate` to the `Event` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "EventDevices_deviceID_key";

-- DropIndex
DROP INDEX "EventDevices_eventID_key";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "EventDevices";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "_DeviceGroupToEvent" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_DeviceGroupToEvent_A_fkey" FOREIGN KEY ("A") REFERENCES "DeviceGroup" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_DeviceGroupToEvent_B_fkey" FOREIGN KEY ("B") REFERENCES "Event" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Event" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "creatorID" INTEGER NOT NULL,
    "customerID" INTEGER NOT NULL,
    "locationID" INTEGER NOT NULL,
    "startDate" DATETIME NOT NULL,
    "endDate" DATETIME NOT NULL,
    "offerID" INTEGER NOT NULL,
    CONSTRAINT "Event_customerID_fkey" FOREIGN KEY ("customerID") REFERENCES "Customer" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Event_locationID_fkey" FOREIGN KEY ("locationID") REFERENCES "Location" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Event_offerID_fkey" FOREIGN KEY ("offerID") REFERENCES "Offer" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Event" ("creatorID", "customerID", "id", "locationID", "offerID") SELECT "creatorID", "customerID", "id", "locationID", "offerID" FROM "Event";
DROP TABLE "Event";
ALTER TABLE "new_Event" RENAME TO "Event";
CREATE UNIQUE INDEX "Event_creatorID_key" ON "Event"("creatorID");
CREATE UNIQUE INDEX "Event_customerID_key" ON "Event"("customerID");
CREATE UNIQUE INDEX "Event_locationID_key" ON "Event"("locationID");
CREATE UNIQUE INDEX "Event_offerID_key" ON "Event"("offerID");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "_DeviceGroupToEvent_AB_unique" ON "_DeviceGroupToEvent"("A", "B");

-- CreateIndex
CREATE INDEX "_DeviceGroupToEvent_B_index" ON "_DeviceGroupToEvent"("B");
