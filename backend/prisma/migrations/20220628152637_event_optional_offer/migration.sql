-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Event" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "creatorID" INTEGER NOT NULL,
    "customerID" INTEGER NOT NULL,
    "locationID" INTEGER NOT NULL,
    "startDate" DATETIME NOT NULL,
    "endDate" DATETIME NOT NULL,
    "offerID" INTEGER,
    CONSTRAINT "Event_customerID_fkey" FOREIGN KEY ("customerID") REFERENCES "Customer" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Event_locationID_fkey" FOREIGN KEY ("locationID") REFERENCES "Location" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Event_offerID_fkey" FOREIGN KEY ("offerID") REFERENCES "Offer" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Event" ("creatorID", "customerID", "endDate", "id", "locationID", "offerID", "startDate") SELECT "creatorID", "customerID", "endDate", "id", "locationID", "offerID", "startDate" FROM "Event";
DROP TABLE "Event";
ALTER TABLE "new_Event" RENAME TO "Event";
CREATE UNIQUE INDEX "Event_creatorID_key" ON "Event"("creatorID");
CREATE UNIQUE INDEX "Event_customerID_key" ON "Event"("customerID");
CREATE UNIQUE INDEX "Event_locationID_key" ON "Event"("locationID");
CREATE UNIQUE INDEX "Event_offerID_key" ON "Event"("offerID");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
