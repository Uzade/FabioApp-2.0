/*
  Warnings:

  - You are about to drop the column `city` on the `Location` table. All the data in the column will be lost.
  - You are about to drop the column `number` on the `Location` table. All the data in the column will be lost.
  - You are about to drop the column `street` on the `Location` table. All the data in the column will be lost.
  - Added the required column `adress` to the `Location` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Location" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "isEvent" BOOLEAN NOT NULL,
    "isStorage" BOOLEAN NOT NULL,
    "name" TEXT NOT NULL,
    "adress" TEXT NOT NULL,
    "details" TEXT
);
INSERT INTO "new_Location" ("details", "id", "isEvent", "isStorage", "name") SELECT "details", "id", "isEvent", "isStorage", "name" FROM "Location";
DROP TABLE "Location";
ALTER TABLE "new_Location" RENAME TO "Location";
CREATE UNIQUE INDEX "Location_adress_key" ON "Location"("adress");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
