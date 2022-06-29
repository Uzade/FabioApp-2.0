-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Permition" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL DEFAULT 'Moin',
    "seeOwnOffers" BOOLEAN NOT NULL,
    "requestOffers" BOOLEAN NOT NULL,
    "scanDevices" BOOLEAN NOT NULL,
    "manageOffers" BOOLEAN NOT NULL,
    "manageDevices" BOOLEAN NOT NULL,
    "manageEvents" BOOLEAN NOT NULL
);
INSERT INTO "new_Permition" ("id", "manageDevices", "manageEvents", "manageOffers", "requestOffers", "scanDevices", "seeOwnOffers") SELECT "id", "manageDevices", "manageEvents", "manageOffers", "requestOffers", "scanDevices", "seeOwnOffers" FROM "Permition";
DROP TABLE "Permition";
ALTER TABLE "new_Permition" RENAME TO "Permition";
CREATE UNIQUE INDEX "Permition_name_key" ON "Permition"("name");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
